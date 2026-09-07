#!/bin/bash
# usage: ./combine.sh /path/to/directory output.md

set -euo pipefail

TARGET_DIR="${1:-.}"
OUTPUT_FILE="${2:-master.txt}"

# clear/create output file
>"$OUTPUT_FILE"

# find all files recursively, sorted, excluding the output file itself
find "$TARGET_DIR" -type f ! -path "$(realpath "$OUTPUT_FILE")" | sort | while IFS= read -r file; do
  {
    echo "-----"
    echo "$file"
    echo "-----"
    echo ""
    cat "$file"
    echo ""
    echo ""
  } >>"$OUTPUT_FILE"
done

echo "Done. Combined output written to $OUTPUT_FILE"
