#!/bin/bash

# termify-sentinel.sh
# A script to check GitHub repositories listed in README.md for deprecation (archived status)
# and verify non-GitHub links for dead links using 'deadlink' tool.
#
# Usage: ./termify-sentinel.sh [--help]
# Output:
#   Deprecated repositories are saved in deprecated_termify.txt

PARALLEL_JOBS=6
OUTPUT_FILE="deprecated_termify.txt"
README_FILE="README.md"

print_help() {
  cat <<EOF
Usage: $0 [--help|-h|help]

Checks GitHub repositories in $README_FILE for archive status (deprecation)
using GitHub's API. Also checks non-GitHub links for dead links using 'deadlink'
if it is installed.

Options:
  --help, -h, help   Show this help message and exit.

Output:
  Deprecated repos are logged to: $OUTPUT_FILE

Note:
  Requires 'curl' for GitHub API requests.
  Optional: 'deadlink' for checking non-GitHub URLs.
EOF
}

# Check if GitHub repos are archived using GitHub API
check_archived_github_repos() {
  echo "Checking GitHub repositories (via API) for archived status..."

  # Extract unique owner/repo paths from README links
  repo_paths=$(grep -oE 'https://github.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+' "$README_FILE" \
    | sed 's|https://github.com/||' \
    | sort -u)

  if [[ -z "$repo_paths" ]]; then
    echo "No GitHub repositories found in $README_FILE."
    return
  fi

  i=0
  for repo_path in $repo_paths; do
    ((i=i % PARALLEL_JOBS)); ((i++ == 0)) && wait

    {
      repo_url="https://github.com/$repo_path"
      api_url="https://api.github.com/repos/$repo_path"

      response=$(curl -s "$api_url")
      archived=$(echo "$response" | grep '"archived":' | awk '{print $2}' | tr -d ',')

      if [[ "$archived" == "true" ]]; then
        echo "DEPRECATED $repo_url" | tee -a "$OUTPUT_FILE"
      else
        echo "CHECKED $repo_url"
      fi
    } &
  done

  wait
  echo "GitHub API repo check completed."
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

# Handle help
if [[ "$1" =~ ^(--help|-h|help)$ ]]; then
  print_help
  exit 0
fi

echo "Starting Termify Sentinel..."

# Clear output file
> "$OUTPUT_FILE"

check_archived_github_repos
check_non_github_links

echo "Termify Sentinel finished."
echo "Deprecated repos saved in: $OUTPUT_FILE"
