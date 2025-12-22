#!/bin/bash
set -e

# Output file
OUTPUT="assets/the-japanese-maple-book.epub"

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
    
    # Process the file: extract front matter, replace {{ page.* }} variables, output markdown
    python3 scripts/process_liquid.py "$file" >> "$COMBINED_MD"
done

# CLEANUP for Pandoc (Strip Liquid tags and fix paths)
echo "Cleaning up Liquid tags for Pandoc..."

# 1. Handle any remaining {{ ... | relative_url }} patterns
sed -E 's/\{\{[[:space:]]*["\047]?\/?([^"\047]+)["\047]?[[:space:]]*\|[[:space:]]*relative_url[[:space:]]*\}\}/\1/g' "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"

# 2. Clean up paths in markdown image/link syntax: ![Alt]('/path/to/img') -> ![Alt](assets/path/to/img)
# Step A: Handle leading slashes (e.g., /assets/images -> assets/images)
sed -E "s|\]\(['\047\"]*/|](|g" "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"
# Step B: Ensure paths that don't start with assets/ get it (if they look like images)
sed -E "s|\]\((images/)|](assets/\1|g" "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"
# Step C: Remove quotes/spaces inside parentheses
sed -E "s|\]\(['\047\"]*|](|g" "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"
sed -E "s|['\047\"]* \)|)|g" "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"
sed -E "s|['\047\"]*\)|)|g" "$COMBINED_MD" > "${COMBINED_MD}.tmp" && mv "${COMBINED_MD}.tmp" "$COMBINED_MD"

echo "Generating EPUB..."
pandoc "$COMBINED_MD" -o "$OUTPUT" --toc --css epub.css --metadata ibooks:specified-fonts=true --epub-cover-image=assets/images/cover.jpg

echo "Done: $OUTPUT"
