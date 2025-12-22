#!/bin/bash
set -e

# Output file
OUTPUT="assets/the-japanese-maple-book.epub"

# Create a temporary file to hold the complete markdown content
COMBINED_MD="combined.md"

# Add title block for Pandoc
echo "% The Japanese Maple Book" > "$COMBINED_MD"
echo "% v2.0 - Dec 2025" >> "$COMBINED_MD"
echo "% Revised Digital Edition by rightedges with Gemini AI" >> "$COMBINED_MD"
echo "% © 2025 rightedges with Gemini AI" >> "$COMBINED_MD"
echo "" >> "$COMBINED_MD"

# Concatenate files in order based on navigation.yml
grep "file:" _data/navigation.yml | awk '{print $2}' | while read -r file; do
    echo "Processing $file..."
    
    # Add a page break (for epub) if needed, or just newlines
    echo "" >> "$COMBINED_MD"
    echo "---" >> "$COMBINED_MD"
    echo "" >> "$COMBINED_MD"
    
    # Process the file: extract front matter, replace Liquid variables and normalize links
    python3 scripts/process_liquid.py "$file" >> "$COMBINED_MD"
done

echo "Generating EPUB..."
# Using gfm as input format to ensure header IDs are correctly parsed if specified as {#id}
pandoc "$COMBINED_MD" -f markdown+header_attributes -o "$OUTPUT" --toc --css epub.css --metadata ibooks:specified-fonts=true --epub-cover-image=assets/images/cover.jpg

echo "Done: $OUTPUT"
