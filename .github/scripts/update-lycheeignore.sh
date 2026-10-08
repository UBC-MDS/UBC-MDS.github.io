#!/usr/bin/env bash
# Appends every URL inside <span class="dead-link"> in content/ to .lycheeignore
set -euo pipefail
file=.lycheeignore
touch "$file"
grep -rhoP '<span class="dead-link">\s*\Khttps?://[^\s<]+' content | sort -u | while read -r url; do
  pattern="^$(printf '%s' "$url" | sed -e 's/[][\.*^$+?(){}|]/\\&/g')\$"
  grep -qxF -- "$pattern" "$file" || echo "$pattern" >> "$file"
done
