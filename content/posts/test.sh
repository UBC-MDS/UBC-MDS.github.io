#!/bin/sh

for file in *.md; do
    # Extract YYYY-MM-DD from the filename
    date=$(printf '%s\n' "$file" | sed -n 's/^\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)-.*$/\1/p')

    # Skip files that don't match the expected filename format
    [ -z "$date" ] && continue

    # Skip files that already contain a date: field
    if grep -q '^date:' "$file"; then
        echo "Skipping $file (already has date)"
        continue
    fi

    # Insert date: immediately after the title: line
    awk -v d="$date" '
        /^title:/ {
            print
            print "date: " d
            next
        }
        { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    echo "Updated $file"
done
