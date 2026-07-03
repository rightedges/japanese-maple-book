cat << 'EOF' > fix_prop.py
import sys, re
filepath = 'chapters/12-propagation.md'
with open(filepath, 'r') as f:
    content = f.read()
# 1. Remove all existing/duplicated image tags that we accidentally inserted
lines = content.split('\n')
cleaned_lines = [line for line in lines if 'propagation-grafting.jpg' not in line]
content = '\n'.join(cleaned_lines)
# 2. Find the correct Grafting heading and insert the image right below it
# (Handles ## or ### just in case)
heading_pattern = r'(#{2,4}\s+.*?Grafting: The Clinical Precision.*?\n)'
image_tag = "\n![Side-Veneer Grafting Technique](<{{ 'assets/images/propagation-grafting.jpg' | relative_url }}>)\n"
if re.search(heading_pattern, content, re.IGNORECASE):
    # Insert the image immediately after the matched heading
    content = re.sub(heading_pattern, r'\1' + image_tag, content, flags=re.IGNORECASE)
    with open(filepath, 'w') as f:
        f.write(content)
    print('Successfully removed duplicates and moved the image to the Grafting section!')
else:
    print('Error: Could not find the exact Grafting heading.')
EOF
# Execute the fix, clean up, and publish
python3 fix_prop.py
rm fix_prop.py
bundle exec jekyll build
./scripts/generate_epub.sh
git add .
git commit -m "Fix duplicated image and move to correct Grafting section"
git push origin main
