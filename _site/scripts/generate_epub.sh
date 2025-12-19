#!/bin/bash
set -e

# Output file
OUTPUT="book.epub"

# Create a temporary file to hold the complete markdown content
COMBINED_MD="combined.md"

# Add title block for Pandoc
echo "% The Japanese Maple Book" > "$COMBINED_MD"
echo "% Author Name" >> "$COMBINED_MD"
echo "% $(date +%Y)" >> "$COMBINED_MD"
echo "" >> "$COMBINED_MD"

# Concatenate files in order based on navigation.yml
# Note: This is a simple parser for the specific yaml structure. 
# For more robustness, use yq or similar if available, but grep/sed works for simple cases.

# Reading file paths from _data/navigation.yml
# Assuming format: "  file: path/to/file.md"
grep "file:" _data/navigation.yml | awk '{print $2}' | while read -r file; do
    echo "Processing $file..."
    
    # Add a page break (for epub) if needed, or just newlines
    echo "" >> "$COMBINED_MD"
    echo "---" >> "$COMBINED_MD"
    echo "" >> "$COMBINED_MD"
    
    # Append content, stripping Front Matter (lines between first two ---)
    # This simple sed command deletes from line 1 to the second '---' found.
    # It assumes front matter exists.
    sed '1,/^---$/d' "$file" >> "$COMBINED_MD"
done

echo "Generating EPUB..."
pandoc "$COMBINED_MD" -o "$OUTPUT" --toc

echo "Done: $OUTPUT"
