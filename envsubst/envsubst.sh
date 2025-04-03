#!/bin/ash
set -e

# Directory to process
WORK_DIR="/work"

# Find all text files in the work directory
# Using file command to identify text files
FILES=$(find "$WORK_DIR" -type f -exec file {} \; | grep text | cut -d: -f1)

echo "Processing files with envsubst..."

for FILE in $FILES; do
  echo "Processing $FILE"
  envsubst < "$FILE" > /tmp/envsubst || exit 1
  mv /tmp/envsubst "$FILE" || exit 1
done

echo "All files processed successfully"
