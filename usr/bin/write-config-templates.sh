#!/bin/bash
TEMPLATE_FILES=$(find templates -type f)
for templ in $TEMPLATE_FILES; do
    output_file="$(echo "$templ" | cut -d/ -f 2-)"
    echo "Replacing variables in $templ and outputting to $output_file"
    mkdir -p "$(dirname "$output_file")"
    envsubst < "$templ" > "$output_file"
done
