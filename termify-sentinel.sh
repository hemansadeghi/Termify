#!/usr/bin/env bash
set -euo pipefail

# termify-sentinel.sh — Repository health checker for Termify
# Checks GitHub repos in README.md for archived/disabled status (via GitHub API)
# and verifies non-GitHub URLs with curl (no external link-checker required).
#
# Usage:
#   ./termify-sentinel.sh [--readme FILE] [--output FILE] [--jobs N]
#                         [--github-only] [--links-only] [--help]
#
# Env:
#   GITHUB_TOKEN   Optional. Increases API rate limit (60 -> 5000 req/hour).
#
# Exit codes:
#   0 = all healthy, 1 = deprecated/dead links found, 2 = usage/runtime error

PARALLEL_JOBS=6
OUTPUT_FILE="deprecated_termify.txt"
README_FILE="README.md"
CHECK_GITHUB=1
CHECK_LINKS=1

print_help() {
  cat <<EOF
Usage: $0 [options]

Checks GitHub repositories in README for archival status and verifies
non-GitHub links for availability.

Options:
  --readme FILE    README file to scan (default: README.md)
  --output FILE    Report file for problems (default: deprecated_termify.txt)
  --jobs N         Parallel jobs (default: 6, max: 20)
  --github-only    Only check GitHub repos, skip generic links
  --links-only     Only check non-GitHub links, skip GitHub API
  --help, -h       Show this help and exit

Examples:
  $0
  $0 --jobs 10 --github-only
  GITHUB_TOKEN=ghp_xxx $0 --readme README.md

Requirements: curl, grep, sed, sort. Optional (preferred): jq or python3 for JSON.
EOF
}

log() { printf '%s\n' "$*"; }
warn() { printf 'WARN: %s\n' "$*" >&2; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --help|-h|help) print_help; exit 0 ;;
    --readme) README_FILE="${2:?--readme needs a value}"; shift 2 ;;
    --output) OUTPUT_FILE="${2:?--output needs a value}"; shift 2 ;;
    --jobs) PARALLEL_JOBS="${2:?--jobs needs a value}"; shift 2 ;;
    --github-only) CHECK_LINKS=0; shift ;;
    --links-only) CHECK_GITHUB=0; shift ;;
    *) warn "unknown argument: $1"; print_help; exit 2 ;;
  esac
done

if ! [[ "$PARALLEL_JOBS" =~ ^[0-9]+$ ]] || (( PARALLEL_JOBS < 1 )); then
  warn "--jobs must be a positive integer"
  exit 2
fi
(( PARALLEL_JOBS > 20 )) && PARALLEL_JOBS=20

if [[ ! -f "$README_FILE" ]]; then
  warn "README not found: $README_FILE"
  exit 2
fi

command -v curl >/dev/null 2>&1 || { warn "'curl' is required but not installed."; exit 2; }

AUTH_ARGS=()
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
  AUTH_ARGS=(-H "Authorization: Bearer $GITHUB_TOKEN")
fi
API_HEADER_ARGS=(-H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28")

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT
RESULTS_DIR="$TMPDIR/results"
mkdir -p "$RESULTS_DIR"

# Portable JSON field extractor: jq > python3 > grep fallback.
# Prints "archived=<true|false|unknown> disabled=<true|false|unknown>"
parse_repo_flags() {
  if command -v jq >/dev/null 2>&1; then
    jq -r '"archived=\(.archived // "unknown") disabled=\(.disabled // "unknown") message=\(.message // "")"'
  elif command -v python3 >/dev/null 2>&1; then
    python3 -c 'import json,sys
try:
    d=json.load(sys.stdin)
    print(f"archived={str(d.get("archived","unknown")).lower()} disabled={str(d.get("disabled","unknown")).lower()} message={d.get("message","")}")
except Exception as e:
    print(f"archived=unknown disabled=unknown message=parse-error:{e}")'
  else
    grep -E '"(archived|disabled|message)"' | tr '\n' ' ' | sed 's/,/ /g'
  fi
}

extract_github_repos() {
  # Matches https://github.com/owner/repo, strips fragments (? #), .git, trailing punctuation.
  grep -oE 'https://github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+' "$README_FILE" \
    | sed -E 's/#.*$//; s/\?.*$//; s/\.git$//; s/[.,;:!?]+$//' \
    | sed 's|https://github.com/||' \
    | sort -u
}

extract_other_links() {
  grep -Eo 'https?://[^) ]+' "$README_FILE" \
    | grep -v 'https://github.com' \
    | tr -d "\"'<>]" \
    | sed -E 's/[.,;:!?]+$//' \
    | sort -u
}

check_one_github_repo() {
  local repo_path="$1"
  local out="$RESULTS_DIR/github-$(echo "$repo_path" | tr '/.' '__').txt"
  local repo_url="https://github.com/$repo_path"
  local api_url="https://api.github.com/repos/$repo_path"
  local body http_code flags archived disabled message

  if ! body=$(curl -sS --max-time 20 "${AUTH_ARGS[@]}" "${API_HEADER_ARGS[@]}" -w '\n%{http_code}' "$api_url" 2>"$out.curlerr"); then
    printf 'ERROR %s (curl failed: %s)\n' "$repo_url" "$(cat "$out.curlerr" 2>/dev/null | head -n 1)" | tee "$out"
    return 0
  fi
  http_code=$(printf '%s' "$body" | tail -n 1)
  body=$(printf '%s' "$body" | sed '$d')

  if [[ "$http_code" == "404" ]]; then
    printf 'DEPRECATED %s (404 not found — renamed/deleted?)\n' "$repo_url" | tee "$out"
    return 0
  fi
  if [[ "$http_code" == "403" || "$http_code" == "429" ]]; then
    if printf '%s' "$body" | grep -qi 'rate limit'; then
      printf 'ERROR %s (HTTP %s rate-limited — set GITHUB_TOKEN)\n' "$repo_url" "$http_code" | tee "$out"
    else
      printf 'ERROR %s (HTTP %s forbidden)\n' "$repo_url" "$http_code" | tee "$out"
    fi
    return 0
  fi
  if [[ "$http_code" != "200" ]]; then
    printf 'ERROR %s (HTTP %s)\n' "$repo_url" "$http_code" | tee "$out"
    return 0
  fi

  flags=$(printf '%s' "$body" | parse_repo_flags)
  archived=$(printf '%s' "$flags" | grep -oE 'archived=[^ ]+' | cut -d= -f2 || echo unknown)
  disabled=$(printf '%s' "$flags" | grep -oE 'disabled=[^ ]+' | cut -d= -f2 || echo unknown)

  if [[ "$archived" == "true" ]]; then
    printf 'DEPRECATED %s (archived)\n' "$repo_url" | tee "$out"
  elif [[ "$disabled" == "true" ]]; then
    printf 'DEPRECATED %s (disabled)\n' "$repo_url" | tee "$out"
  else
    printf 'OK %s\n' "$repo_url" > "$out"
  fi
}

check_one_link() {
  local url="$1"
  local safe
  safe=$(printf '%s' "$url" | tr -c 'A-Za-z0-9' '_')
  local out="$RESULTS_DIR/link-$safe.txt"
  local code

  code=$(curl -sS -o /dev/null -w '%{http_code}' --max-time 15 -L \
    -A 'Mozilla/5.0 (Termify-Sentinel health check)' "$url" 2>"$out.curlerr" || echo "000")

  if [[ "$code" == "000" ]]; then
    printf 'DEAD %s (connection failed: %s)\n' "$url" "$(cat "$out.curlerr" 2>/dev/null | head -n 1)" | tee "$out"
  elif (( code >= 400 )); then
    printf 'DEAD %s (HTTP %s)\n' "$url" "$code" | tee "$out"
  else
    printf 'OK %s\n' "$url" > "$out"
  fi
}

run_parallel() {
  # $1 = function name, rest = items. Respects PARALLEL_JOBS.
  local fn="$1"; shift
  local running=0
  # shellcheck disable=SC2317
  for item in "$@"; do
    "$fn" "$item" &
    running=$((running + 1))
    if (( running >= PARALLEL_JOBS )); then
      wait -n 2>/dev/null || wait
      running=$((running - 1))
    fi
  done
  wait
}

: > "$OUTPUT_FILE"

total_github=0
total_links=0

if (( CHECK_GITHUB )); then
  log "Checking GitHub repositories (via API)..."
  mapfile -t repos < <(extract_github_repos || true)
  total_github=${#repos[@]}
  if (( total_github == 0 )); then
    log "No GitHub repositories found in $README_FILE."
  else
    log "Found $total_github unique GitHub repos (jobs=$PARALLEL_JOBS)."
    run_parallel check_one_github_repo "${repos[@]}"
  fi
fi

if (( CHECK_LINKS )); then
  log "Checking non-GitHub links (via curl)..."
  mapfile -t links < <(extract_other_links || true)
  total_links=${#links[@]}
  if (( total_links == 0 )); then
    log "No non-GitHub links found."
  else
    log "Found $total_links unique non-GitHub URLs (jobs=$PARALLEL_JOBS)."
    run_parallel check_one_link "${links[@]}"
  fi
fi

deprecated_count=$(grep -h -E '^DEPRECATED' "$RESULTS_DIR"/*.txt 2>/dev/null | wc -l)
dead_count=$(grep -h -E '^DEAD' "$RESULTS_DIR"/*.txt 2>/dev/null | wc -l)
error_count=$(grep -h -E '^ERROR' "$RESULTS_DIR"/*.txt 2>/dev/null | wc -l)

{
  echo "# Termify Sentinel Report"
  echo "# Generated: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  echo "# Source: $README_FILE"
  echo ""
  grep -h -E '^(DEPRECATED|DEAD|ERROR)' "$RESULTS_DIR"/*.txt 2>/dev/null || true
} > "$OUTPUT_FILE" || true

log "----------------------------------------"
log "GitHub repos checked : ${total_github}"
log "Other links checked  : ${total_links}"
log "Deprecated repos     : ${deprecated_count}"
log "Dead links           : ${dead_count}"
log "Errors (net/rate)    : ${error_count}"
log "Report saved in      : $OUTPUT_FILE"

if (( deprecated_count > 0 || dead_count > 0 )); then
  exit 1
fi
exit 0
