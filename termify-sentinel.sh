#!/bin/bash

# termify-sentinel.sh
# A script to check GitHub repositories listed in README.md for deprecation (archived status)
# and verify non-GitHub links for dead links using 'deadlink' tool.
#
# Usage: ./termify-sentinel.sh [--help]
# Runs parallel checks for better performance.
#
# Output:
#   Deprecated repositories are saved in deprecated_termify.txt
#

PARALLEL_JOBS=6
OUTPUT_FILE="deprecated_termify.txt"
README_FILE="README.md"

print_help() {
  cat <<EOF
Usage: $0 [--help|-h|help]

Checks GitHub repositories in $README_FILE for archive status (deprecation).
Also checks non-GitHub links for dead links using 'deadlink' if installed.

Options:
  --help, -h, help   Show this help message and exit.

Output:
  Deprecated repos are logged to: $OUTPUT_FILE

Note:
  Requires 'curl' for GitHub checks and 'deadlink' (optional) for link checking.
EOF
}

# Check if GitHub repos in README are archived
check_archived_github_repos() {
  echo "Checking GitHub repositories for archived status..."

  # Extract GitHub repo URLs from markdown links
  repos=$(grep -Eo '\[.*\]\((https://github.com/[^)]+)\)' "$README_FILE" | grep -Eo 'https://github.com/[^)]+')

  if [[ -z "$repos" ]]; then
    echo "No GitHub repositories found in $README_FILE."
    return
  fi

  i=0
  for repo_url in $repos; do
    ((i=i % PARALLEL_JOBS)); ((i++ == 0)) && wait

    {
      if curl -SsL "$repo_url" | grep -q "This repository has been archived by the owner on"; then
        echo "DEPRECATED $repo_url" | tee -a "$OUTPUT_FILE"
      else
        echo "CHECKED $repo_url"
      fi
    } &
  done
  wait
  echo "GitHub repo check completed."
}

# Check non-GitHub links for dead links using deadlink
check_non_github_links() {
  if ! command -v deadlink &>/dev/null; then
    echo "Warning: 'deadlink' tool not found. Skipping non-GitHub link check."
    return
  fi

  echo "Checking non-GitHub links for dead links..."

  tmpfile=$(mktemp)
  grep -Eo 'https?://[^) ]+' "$README_FILE" | grep -v 'https://github.com' > "$tmpfile"

  if [[ ! -s $tmpfile ]]; then
    echo "No non-GitHub links found to check."
    rm -f "$tmpfile"
    return
  fi

  deadlink check "$tmpfile"
  rm -f "$tmpfile"

  echo "Non-GitHub link check completed."
}

if [[ "$1" =~ ^(--help|-h|help)$ ]]; then
  print_help
  exit 0
fi

echo "Starting Termify Sentinel..."

# Clear output file before starting
> "$OUTPUT_FILE"

check_archived_github_repos
check_non_github_links

echo "Termify Sentinel finished."
echo "Deprecated repos saved in: $OUTPUT_FILE"
