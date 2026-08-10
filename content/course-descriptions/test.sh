#!/bin/sh

for file in *.md; do
    grep -q '^layout:' "$file" && continue

    awk '
    NR == 1 && $0 == "---" {
        print
        print "layout: page"
        next
    }
    { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "Updated $file"
done
