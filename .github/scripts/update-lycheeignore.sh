#!/usr/bin/env bash
# Appends to .lycheeignore every URL that is either inside <span class="dead-link">
# or inside a fenced markdown code block in content/
set -euo pipefail
file=.lycheeignore
touch "$file"

dead_links() {
  grep -rhoP '<span class="dead-link">\s*\Khttps?://[^\s<]+' content || true
}

code_block_urls() {
  find content -name '*.md' -print0 | xargs -0 -r awk '
    /^[ \t]*(```|~~~)/ { in_code = !in_code; next }
    in_code { while (match($0, /https?:\/\/[^ \t"'"'"'`<>)\]]+/)) {
      print substr($0, RSTART, RLENGTH); $0 = substr($0, RSTART + RLENGTH) } }
  ' | sed -E 's/[.,;:]+$//'
}

{ dead_links; code_block_urls; } | sort -u | while read -r url; do
  pattern="^$(printf '%s' "$url" | sed -e 's/[][\.*^$+?(){}|]/\\&/g')\$"
  grep -qxF -- "$pattern" "$file" || echo "$pattern" >> "$file"
done
