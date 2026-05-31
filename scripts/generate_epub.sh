#!/bin/bash
set -e
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Output file
OUTPUT="assets/japanese-maple.epub"

# Create a temporary file to hold the complete markdown content
COMBINED_MD="combined.md"

# Increment version in _config.yml automatically (Smart Logic)
echo "Incrementing version..."
VERSION=$(python3 -c "
import re
from datetime import datetime

today = datetime.now().strftime('%Y-%m-%d')

with open('_config.yml', 'r') as f:
    content = f.read()

# Extract current version and date
v_match = re.search(r'version: \"(.*)\"', content)
d_match = re.search(r'last_updated_date: \"(.*)\"', content)

if v_match and d_match:
    v = v_match.group(1)
    last_date = d_match.group(1)
    
    parts = list(map(int, v.split('.')))
    
    if last_date != today:
        # First edit of the day: increment minor (X.Y -> X.Y+1)
        # Handle case where it might already have a patch (e.g., 2.3.1 -> 2.4)
        parts = [parts[0], parts[1] + 1]
    else:
        # Subsequent edit: increment patch (X.Y -> X.Y.1)
        if len(parts) == 2:
            parts.append(1)
        else:
            parts[2] += 1
            
    new_v = '.'.join(map(str, parts))
    
    # Update content
    content = re.sub(r'version: \".*\"', f'version: \"{new_v}\"', content)
    content = re.sub(r'last_updated_date: \".*\"', f'last_updated_date: \"{today}\"', content)
    
    with open('_config.yml', 'w') as f:
        f.write(content)
    print(new_v)
")

DATE=$(date +"%b %Y")

# Add title block for Pandoc
echo "% Japanese Maple" > "$COMBINED_MD"
echo "% $VERSION - $DATE" >> "$COMBINED_MD"
echo "% Revised Digital Edition by rightedges with Gemini AI" >> "$COMBINED_MD"
echo "% © $(date +"%Y") rightedges with Gemini AI" >> "$COMBINED_MD"
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
pandoc "$COMBINED_MD" -f markdown+header_attributes -o "$OUTPUT" --toc --css epub.css --metadata ibooks:specified-fonts=true --epub-cover-image=assets/images/cover.png

echo "Done: $OUTPUT"
