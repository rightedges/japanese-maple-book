#!/bin/bash
set -e

# Output file
OUTPUT="book.epub"

# Create a temporary file to hold the complete markdown content
COMBINED_MD="combined.md"

# Add title block for Pandoc
echo "% The Japanese Maple Book" > "$COMBINED_MD"
echo "% Revised Digital Edition by rightedges with Gemini AI" >> "$COMBINED_MD"
echo "% © 2025 rightedges with Gemini AI" >> "$COMBINED_MD"
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
    sed '1,/^---$/d' "$file" >> "$COMBINED_MD"
done

# CLEANUP for Pandoc (Strip Liquid tags and fix paths)
echo "Cleaning up Liquid tags for Pandoc..."

# 1. Handle any remaining {{ ... | relative_url }} patterns
sed -i "" -E 's/\{\{[[:space:]]*["'"'"']?\/?([^"'"'"']+)["'"'"']?[[:space:]]*\|[[:space:]]*relative_url[[:space:]]*\}\}/\1/g' "$COMBINED_MD"

# 2. Clean up curly single quotes around paths and remove leading slashes
# Pattern: ''/path/to/file.ext'' -> assets/path/to/file.ext
sed -i "" -E "s|''/|assets/|g" "$COMBINED_MD"
sed -i "" -E "s|'' \)|)|g" "$COMBINED_MD"

echo "Generating EPUB..."
pandoc "$COMBINED_MD" -o "$OUTPUT" --toc --css epub.css --metadata ibooks:specified-fonts=true --epub-cover-image=assets/images/cover.jpg

echo "Done: $OUTPUT"
