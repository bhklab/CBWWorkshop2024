#!/bin/bash

# Usage:
# ./clear_code.sh input.Rmd output.Rmd --keep setup load_tre subset_pset2-solution

INPUT_FILE=$1
OUTPUT_FILE=$2
shift 2 # Shift the first two arguments to get the rest
KEEPS=()

# Parse --keep options
while [[ "$1" != "" ]]; do
    case $1 in
        --keep ) 
            shift
            while [[ "$1" != "" && "$1" != --* ]]; do
                KEEPS+=("$1")
                shift
            done
            ;;
        * ) break ;;
    esac
done

# Create a pattern to match R chunks that we want to keep
KEEP_PATTERN=""
for KEEP in "${KEEPS[@]}"; do
    if [ -n "$KEEP_PATTERN" ]; then
        KEEP_PATTERN="$KEEP_PATTERN|$KEEP"
    else
        KEEP_PATTERN="$KEEP"
    fi
done

# Use awk to process the file
awk -v keep="$KEEP_PATTERN" '
BEGIN {
    in_chunk = 0
    keep_chunk = 0
}

/^```{r/ {
    in_chunk = 1
    keep_chunk = 0
    if (length(keep) > 0) {
        n = split(keep, arr, "|")
        for (i = 1; i <= n; i++) {
            if ($0 ~ arr[i]) {
                keep_chunk = 1
                break
            }
        }
    }
    print $0  # Print the chunk header
    next
}

/^```$/ && in_chunk {
    in_chunk = 0
    print $0  # Print the chunk footer
    next
}

in_chunk && !keep_chunk {
    # Replace code inside the chunk with blank lines
    print ""  # Add a blank line instead of removing it completely
    next
}

{ print }  # Print everything else
' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Code cleared. Output written to $OUTPUT_FILE"