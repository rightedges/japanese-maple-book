require 'yaml'
require 'fileutils'

CULTIVARS_DIR = File.join(__dir__, '..', '_cultivars')
ASSETS_DIR = File.join(__dir__, '..', 'assets', 'images')
FileUtils.mkdir_p(ASSETS_DIR)
SVG_FILE = File.join(ASSETS_DIR, 'comparison-chart-v3.svg')
OUTPUT_FILE = File.join(__dir__, '..', 'chapters', 'appendix-c-comparison-chart.md')

def parse_mature_size(habit_str)
  if habit_str =~ /\((\d+(?:\.\d+)?)-(\d+(?:\.\d+)?)'\)/
    return ($1.to_f + $2.to_f) / 2.0
  elsif habit_str =~ /\((\d+(?:\.\d+)?)'\)/
    return $1.to_f
  end
  10.0 # Default if no size found
end

def extract_color(color_str)
  str = color_str.downcase
  if str.include?('burgundy') || str.include?('purple') || str.include?('dark red')
    '#800020'
  elsif str.include?('red') || str.include?('scarlet') || str.include?('carmine')
    '#cc3333'
  elsif str.include?('orange') || str.include?('peach') || str.include?('amber')
    '#e67e22'
  elsif str.include?('yellow') || str.include?('gold')
    '#f1c40f'
  elsif str.include?('chartreuse') || str.include?('lime')
    '#7fff00'
  elsif str.include?('pink') || str.include?('rose')
    '#ff66b2'
  elsif str.include?('white') || str.include?('cream')
    '#f5f5dc'
  else
    '#2ecc71'
  end
end

cultivars = []

Dir.glob(File.join(CULTIVARS_DIR, '*.md')).each do |file|
  content = File.read(file, encoding: 'UTF-8')
  if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    frontmatter = YAML.safe_load($1)
    
    # Use mature size directly instead of 10-year calculations
    size_ft = parse_mature_size(frontmatter['habit'].to_s)
    
    cultivars << {
      title: frontmatter['title'],
      size: size_ft,
      color: extract_color(frontmatter['foliage_sum_fall'].to_s)
    }
  end
end

# Sort by height as requested
cultivars.sort_by! { |c| c[:size] }

max_size = 25.0 # Max size is now 25 since some hit 20-25'
items_per_row = 12
rows = cultivars.each_slice(items_per_row).to_a

# SVG dimensions
row_width = 800
chart_height = 250
label_area = 150
row_height_total = chart_height + label_area
total_height = rows.length * row_height_total + 50
left_margin = 50
right_margin = 20
item_spacing = (row_width - left_margin - right_margin) / items_per_row.to_f
max_chart_y = chart_height - 20 # 20px padding top

svg = <<-SVG
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 #{row_width} #{total_height}" width="100%" height="100%">
  <defs>
    <style>
      .label { font-family: sans-serif; font-size: 11px; fill: #333; }
      .tick { font-family: sans-serif; font-size: 10px; fill: #666; text-anchor: end; }
      .axis { stroke: #ccc; stroke-width: 1; }
      .grid { stroke: #eee; stroke-width: 1; stroke-dasharray: 4,4; }
    </style>
  </defs>
  <rect width="100%" height="100%" fill="white" />
SVG

rows.each_with_index do |row, row_idx|
  y_offset = row_idx * row_height_total + 20
  baseline_y = y_offset + max_chart_y
  
  # Draw Y axis
  svg += "  <line x1=\"#{left_margin}\" y1=\"#{y_offset}\" x2=\"#{left_margin}\" y2=\"#{baseline_y}\" class=\"axis\" />\n"
  # Draw Baseline
  svg += "  <line x1=\"#{left_margin}\" y1=\"#{baseline_y}\" x2=\"#{row_width - right_margin}\" y2=\"#{baseline_y}\" class=\"axis\" />\n"
  
  # Draw ticks and grid lines (0, 5, 10, 15, 20, 25 feet)
  (0..25).step(5).each do |tick|
    tick_y = baseline_y - (tick / max_size) * max_chart_y
    svg += "  <line x1=\"#{left_margin - 5}\" y1=\"#{tick_y}\" x2=\"#{row_width - right_margin}\" y2=\"#{tick_y}\" class=\"grid\" />\n"
    svg += "  <text x=\"#{left_margin - 10}\" y=\"#{tick_y + 4}\" class=\"tick\">#{tick}'</text>\n"
  end
  
  row.each_with_index do |c, i|
    x_center = left_margin + (i + 0.5) * item_spacing
    item_h = (c[:size] / max_size) * max_chart_y
    item_w = [item_h * 0.4, 15].max
    item_w = [item_w, item_spacing * 0.8].min # cap width
    
    x_left = x_center - item_w / 2.0
    x_right = x_center + item_w / 2.0
    y_top = baseline_y - item_h
    r = item_w / 2.0
    
    # Path for a shape with rounded top
    path_d = "M #{x_left} #{baseline_y} L #{x_left} #{y_top + r} A #{r} #{r} 0 0 1 #{x_right} #{y_top + r} L #{x_right} #{baseline_y} Z"
    
    svg += "  <!-- #{c[:title]} -->\n"
    svg += "  <path d=\"#{path_d}\" fill=\"#{c[:color]}\" />\n"
    
    # Label
    svg += "  <text x=\"#{x_center + 4}\" y=\"#{baseline_y + 10}\" class=\"label\" transform=\"rotate(90, #{x_center + 4}, #{baseline_y + 10})\">#{c[:title]}</text>\n"
  end
end

svg += "</svg>\n"
File.write(SVG_FILE, svg)
puts "SVG chart generated at #{SVG_FILE}"

markdown = <<-MD
---
layout: default
title: "Appendix C: Comparison Chart"
parent: "Part VII: Appendices"
nav_order: 3
permalink: /chapters/appendix-c-comparison-chart.html
---

# Appendix C: Mature Size Comparison Chart

This chart visualizes the approximate mature sizes of the Japanese Maples in our library, sorted from smallest to tallest. The colors represent their typical summer/fall foliage hues.

![Comparison Chart]({{ 'assets/images/comparison-chart-v3.svg' | relative_url }})

> **Note:** Sizes represent the average mature height (typically 15-20+ years of growth). Actual sizes will vary depending on climate, soil, and care.

---

[← Previous: Appendix B]({{ site.baseurl }}/chapters/appendix-b-table.html)
MD

File.write(OUTPUT_FILE, markdown)
puts "Markdown generated at #{OUTPUT_FILE}"
