#!/usr/bin/env python3
"""
Process markdown files for EPUB generation.
Extracts YAML front matter and replaces Liquid template variables.
"""

import re
import sys
import os

def parse_simple_yaml(yaml_str):
    """Simple YAML parser for key: value pairs."""
    data = {}
    for line in yaml_str.split('\n'):
        line = line.strip()
        if not line or line.startswith('#'):
            continue
        
        # Match: key: value (with or without quotes)
        match = re.match(r'^(\w+):\s*(.+)$', line)
        if match:
            key = match.group(1)
            value = match.group(2).strip()
            # Remove surrounding quotes if present
            if (value.startswith('"') and value.endswith('"')) or \
               (value.startswith("'") and value.endswith("'")):
                value = value[1:-1]
            data[key] = value
    
    return data

def process_file(filepath):
    """Process a single markdown file, replacing Liquid variables and filters."""
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

    # 1. Replace {{ page.variable }} with actual values
    def replace_page_var(match):
        var_name = match.group(1)
        if var_name in front_matter:
            return str(front_matter[var_name])
        return match.group(0)
    
    processed = re.sub(r'\{\{\s*page\.(\w+)\s*\}\}', replace_page_var, markdown_content)
    
    # 2. Replace {{ site.baseurl }} with empty string
    processed = re.sub(r'\{\{\s*site\.baseurl\s*\}\}', '', processed)

    # 3. Handle {{ 'path' | relative_url }}
    processed = re.sub(r'\{\{\s*["\']?([^"\']+)["\']?\s*\|\s*relative_url\s*\}\}', r'\1', processed)

    # 4. Standardize Internal Links for Pandoc Anchors
    # Handle spaces and slashes inside brackets: ]( /chapters/foo.html ) -> ](#foo)
    
    # helper to clean up paths inside markdown links
    def normalize_link(match):
        prefix = match.group(1) # ](
        path = match.group(2).strip()
        suffix = match.group(3) # )
        
        # Remove leading slashes
        path = path.lstrip('/')
        
        # /chapters/xx.html -> #xx
        if path.startswith('chapters/') and path.endswith('.html'):
            target = path.replace('chapters/', '').replace('.html', '')
            return f'{prefix}#{target}{suffix}'
        
        # cultivars/xx -> #xx
        if path.startswith('cultivars/'):
            target = path.replace('cultivars/', '')
            return f'{prefix}#{target}{suffix}'
            
        # Root link / -> #the-japanese-maple-book
        if path == '' or path == '/':
            return f'{prefix}#the-japanese-maple-book{suffix}'
            
        # Images: images/foo -> assets/images/foo
        if path.startswith('images/'):
            return f'{prefix}assets/{path}{suffix}'
            
        return f'{prefix}{path}{suffix}'

    # Match ]( path )
    processed = re.sub(r'(\]\()([^)]+)(\))', normalize_link, processed)

    # 5. Remove the EPUB download link line from the EPUB content itself (index.md)
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
