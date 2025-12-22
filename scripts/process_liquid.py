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
    # /chapters/xx.html -> #xx
    processed = re.sub(r'(\]\()/chapters/([^/)]+)\.html\)', r'\1#\2)', processed)
    # /chapters/xx.md -> #xx (if any exist)
    processed = re.sub(r'(\]\()/chapters/([^/)]+)\.md\)', r'\1#\2)', processed)
    # /cultivars/xx -> #xx
    processed = re.sub(r'(\]\()/cultivars/([^/)]+)\)', r'\1#\2)', processed)
    # Root link / -> #the-japanese-maple-book
    processed = re.sub(r'(\]\()/(\))', r'\1#the-japanese-maple-book\2', processed)

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
