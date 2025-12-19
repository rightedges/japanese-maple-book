#!/usr/bin/env python3
"""
Process markdown files for EPUB generation.
Extracts YAML front matter and replaces Liquid template variables.
"""

import re
import sys


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
    """Process a single markdown file, replacing {{ page.* }} variables."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract front matter
    front_matter_match = re.match(r'^---\s*\n(.*?)\n---\s*\n(.*)$', content, re.DOTALL)
    
    if not front_matter_match:
        # No front matter, return content as-is
        return content
    
    front_matter_str = front_matter_match.group(1)
    markdown_content = front_matter_match.group(2)
    
    # Parse YAML front matter
    front_matter = parse_simple_yaml(front_matter_str)
    
    # Replace {{ page.variable }} with actual values
    def replace_liquid_var(match):
        var_name = match.group(1)
        if var_name in front_matter:
            return str(front_matter[var_name])
        return match.group(0)  # Keep original if not found
    
    processed_content = re.sub(r'\{\{\s*page\.(\w+)\s*\}\}', replace_liquid_var, markdown_content)
    
    return processed_content


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: process_liquid.py <markdown_file>", file=sys.stderr)
        sys.exit(1)
    
    result = process_file(sys.argv[1])
    print(result, end='')
