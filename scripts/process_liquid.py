#!/usr/bin/env python3
"""
Process markdown files for EPUB generation.
Extracts YAML front matter, replaces Liquid variables, and normalizes links.
Automatically adds anchors to H1 headers for internal linking.
"""

import re
import sys
import os

# Configuration for site variables
BASEURL = 'japanese-maple-book'

# Mapping of chapter/appendix text to anchor IDs
REF_MAP = {
    "Chapter 1": "01-introduction",
    "Chapter 2": "02-seven-groups",
    "Chapter 3": "03-famous-cultivars",
    "Chapter 4": "04-buying",
    "Chapter 5": "05-siting-planting",
    "Chapter 6": "06-watering",
    "Chapter 7": "07-containers",
    "Chapter 8": "08-fertilization",
    "Chapter 9": "09-seasonal-color",
    "Chapter 10": "10-companion-planting",
    "Chapter 11": "11-pruning",
    "Chapter 12": "12-propagation",
    "Chapter 13": "13-pests-diseases",
    "Chapter 14": "14-environmental-stress",
    "Chapter 15": "15-calendar",
    "Chapter 16": "16-bonsai",
    "Chapter 17": "cultivar-library",
    "Appendix A": "appendix-a-table"
}

def parse_simple_yaml(yaml_str):
    """Simple YAML parser for key: value pairs."""
    data = {}
    for line in yaml_str.split('\n'):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        match = re.match(r'^(\w+):\s*(.+)$', line)
        if match:
            key = match.group(1)
            value = match.group(2).strip()
            if (value.startswith('"') and value.endswith('"')) or \
               (value.startswith("'") and value.endswith("'")):
                value = value[1:-1]
            data[key] = value
    return data

def process_file(filepath):
    """Process a single markdown file for EPUB."""
    filename = os.path.basename(filepath).replace('.md', '')
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract front matter
    front_matter_match = re.match(r'^---\s*\n(.*?)\n---\s*\n(.*)$', content, re.DOTALL)
    
    if front_matter_match:
        front_matter_str = front_matter_match.group(1)
        markdown_content = front_matter_match.group(2)
        front_matter = parse_simple_yaml(front_matter_str)
    else:
        front_matter = {}
        markdown_content = content

    # Special handling for index.md
    if filename == 'index':
        filename = 'the-japanese-maple-book'

    # 1. Add anchor to the FIRST H1 in the file
    # This happens only in the combined.md stream
    h1_match = re.search(r'^#\s+(.*)$', markdown_content, re.MULTILINE)
    if h1_match:
        original_h1 = h1_match.group(0).strip()
        new_h1 = f"{original_h1} {{#{filename}}}"
        # We replace only the first occurrence
        markdown_content = markdown_content.replace(original_h1, new_h1, 1)

    # 2. Replace {{ page.variable }}
    def replace_page_var(match):
        var_name = match.group(1)
        if var_name in front_matter:
            return str(front_matter[var_name])
        return match.group(0)
    
    processed = re.sub(r'\{\{\s*page\.(\w+)\s*\}\}', replace_page_var, markdown_content)
    
    # 3. Replace {{ site.baseurl }}
    processed = re.sub(r'\{\{\s*site\.baseurl\s*\}\}', '', processed)

    # 4. Handle {{ 'path' | relative_url }}
    processed = re.sub(r'\{\{\s*["\']?([^"\']+)["\']?\s*\|\s*relative_url\s*\}\}', r'\1', processed)

    # 5. Normalize Links
    def normalize_link(match):
        prefix = match.group(1) # ](
        path = match.group(2).strip()
        suffix = match.group(3) # )
        
        # Strip outer quotes if any
        path = path.strip("'\"")
        
        # Strip leading slashes and baseurl
        path = path.lstrip('/')
        if path.startswith(BASEURL):
            path = path[len(BASEURL):].lstrip('/')
            
        # /chapters/xx.html -> #xx
        if path.startswith('chapters/') and path.endswith('.html'):
            target = path.replace('chapters/', '').replace('.html', '')
            return f'{prefix}#{target}{suffix}'
            
        # cultivars/xx -> #xx
        if path.startswith('cultivars/'):
            target = path.replace('cultivars/', '')
            return f'{prefix}#{target}{suffix}'
            
        if path == '' or path == '/':
            return f'{prefix}#the-japanese-maple-book{suffix}'
            
        if path.startswith('images/'):
            return f'{prefix}assets/{path}{suffix}'
            
        return f'{prefix}{path}{suffix}'

    # Match ]( path ) - be careful with greedy matching if multiple links on one line
    # Using [^)]+ for path is usually okay as long as paths don't contain )
    processed = re.sub(r'(\]\()([^)]+)(\))', normalize_link, processed)

    # 6. Auto-link text references (Chapter X)
    def auto_link_refs(match):
        inner_text = match.group(1).strip()
        if inner_text in REF_MAP:
            return f'([{inner_text}](#{REF_MAP[inner_text]}))'
        return match.group(0)

    processed = re.sub(r'\((Chapter \d+|Appendix [A-Z])\)', auto_link_refs, processed)

    # 7. Hide EPUB download from EPUB
    processed = re.sub(r'\[Download EPUB Version.*?\n', '', processed)

    return processed

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: process_liquid.py <markdown_file>", file=sys.stderr)
        sys.exit(1)
    
    filepath = sys.argv[1]
    if not os.path.exists(filepath):
        print(f"File not found: {filepath}", file=sys.stderr)
        sys.exit(1)
        
    result = process_file(filepath)
    print(result, end='')
