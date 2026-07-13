require 'yaml'
require 'fileutils'

CULTIVARS_DIR = File.join(__dir__, '..', '_cultivars')
OUTPUT_FILE = File.join(__dir__, '..', 'chapters', 'appendix-c-comparison-chart.md')

def parse_growth(growth_str)
  # look for numbers like "12-18"/yr" or "6-10"
  if growth_str =~ /(\d+)-(\d+)/
    return ($1.to_f + $2.to_f) / 2.0
  elsif growth_str =~ /Fast/i
    return 15.0
  elsif growth_str =~ /Moderate/i
    return 8.0
  elsif growth_str =~ /Slow/i
    return 4.0
  end
  8.0 # default moderate
end

def extract_color(color_str)
  # Use the first part of the color string for simplicity, or map to specific hex
  str = color_str.downcase
  if str.include?('burgundy') || str.include?('purple') || str.include?('dark red')
    '#800020' # Burgundy
  elsif str.include?('red') || str.include?('scarlet') || str.include?('carmine')
    '#cc3333' # Red
  elsif str.include?('orange') || str.include?('peach') || str.include?('amber')
    '#e67e22' # Orange
  elsif str.include?('yellow') || str.include?('gold')
    '#f1c40f' # Gold
  elsif str.include?('chartreuse') || str.include?('lime')
    '#7fff00' # Chartreuse
  elsif str.include?('pink') || str.include?('rose')
    '#ff66b2' # Pink
  elsif str.include?('white') || str.include?('cream')
    '#f5f5dc' # Cream/White
  else
    '#2ecc71' # Default Green
  end
end

cultivars = []

Dir.glob(File.join(CULTIVARS_DIR, '*.md')).each do |file|
  content = File.read(file, encoding: 'UTF-8')
  if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    frontmatter = YAML.safe_load($1)
    
    # calc 10 year size in feet
    inches_per_yr = parse_growth(frontmatter['growth_rate'].to_s)
    size_ft = (inches_per_yr * 10) / 12.0
    
    cultivars << {
      title: frontmatter['title'],
      url: "/japanese-maple-book/cultivars/#{File.basename(file, '.md')}",
      budding: frontmatter['budding'].to_s.strip,
      size: size_ft,
      color: extract_color(frontmatter['foliage_sum_fall'].to_s)
    }
  end
end

# Group by budding
groups = {
  "Early-season" => [],
  "Mid-season" => [],
  "Late-season" => []
}

cultivars.each do |c|
  b = c[:budding]
  b = "Mid-season" unless groups.key?(b)
  groups[b] << c
end

# Sort each group by size
groups.values.each do |group|
  group.sort_by! { |c| c[:size] }
end

# Find max size for scale
max_size = cultivars.map { |c| c[:size] }.max || 20.0
max_scale = ((max_size / 2.0).ceil * 2) # round up to nearest even number

# Generate HTML
html = <<-HTML
<style>
.chart-container {
  display: flex;
  flex-direction: column;
  width: 100%;
  font-family: sans-serif;
  overflow-x: auto;
}
.chart-header {
  display: flex;
  border-bottom: 2px solid #ccc;
  margin-bottom: 10px;
}
.chart-group {
  flex: 1;
  text-align: center;
  font-weight: bold;
  color: #666;
  padding: 5px;
  border-right: 1px dashed #ccc;
}
.chart-group:last-child {
  border-right: none;
}
.chart-body {
  display: flex;
  position: relative;
  height: 400px; /* fixed height for the chart */
  border-bottom: 2px solid #ccc;
}
.chart-y-axis {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 30px;
  border-left: 1px solid #ccc;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.y-tick {
  position: relative;
  width: 100%;
  border-top: 1px solid #ccc;
  height: 0;
}
.y-tick span {
  position: absolute;
  right: -25px;
  top: -10px;
  font-size: 12px;
  color: #666;
}
.chart-grid {
  flex: 1;
  display: flex;
  margin-right: 30px; /* space for y-axis */
}
.chart-section {
  flex: 1;
  position: relative;
  border-right: 1px dashed #eee;
  display: flex;
  align-items: flex-end;
  justify-content: space-around;
  padding: 0 10px;
  flex-wrap: wrap; /* in case of many items */
  overflow: hidden;
}
.chart-section:last-child {
  border-right: none;
}
.plant-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-end;
  width: 40px;
  margin: 0 5px;
  position: relative;
}
.plant-shape {
  width: 100%;
  border-radius: 50% 50% 10% 10%;
  background: #ccc;
  box-shadow: inset -5px -5px 10px rgba(0,0,0,0.2);
  transition: transform 0.2s;
}
.plant-shape:hover {
  transform: scale(1.1);
}
.plant-label {
  font-size: 10px;
  text-align: center;
  writing-mode: vertical-rl;
  text-orientation: mixed;
  transform: rotate(180deg);
  margin-top: 5px;
  color: #555;
  white-space: nowrap;
}
a.plant-link {
  text-decoration: none;
  color: inherit;
}
</style>

<div class="chart-container">
  <h3>Japanese Maple Comparison Chart (10-Year Size)</h3>
  <div class="chart-header">
    <div class="chart-group">EARLY SEASON</div>
    <div class="chart-group">MID SEASON</div>
    <div class="chart-group">LATE SEASON</div>
  </div>
  <div class="chart-body">
    <div class="chart-grid">
HTML

["Early-season", "Mid-season", "Late-season"].each do |g|
  html += "      <div class=\"chart-section\">\n"
  groups[g].each do |c|
    height_px = (c[:size] / max_scale.to_f) * 380 # max 380px tall
    html += <<-ITEM
        <div class="plant-item">
          <a href="#{c[:url]}" class="plant-link" title="#{c[:title]} (10-yr size: #{c[:size].round(1)}')">
            <div class="plant-shape" style="height: #{height_px}px; background: #{c[:color]};"></div>
            <div class="plant-label">#{c[:title]}</div>
          </a>
        </div>
ITEM
  end
  html += "      </div>\n"
end

html += "    </div>\n"
html += "    <div class=\"chart-y-axis\">\n"

# Add Y ticks (every 2 feet)
ticks = (0..max_scale).step(2).to_a.reverse
ticks.each do |t|
  html += "      <div class=\"y-tick\"><span>#{t}'</span></div>\n"
end

html += "    </div>\n"
html += "  </div>\n"
html += "</div>\n"

markdown = <<-MD
---
layout: default
title: "Appendix C: Comparison Chart"
parent: "Part VIII: Appendices"
nav_order: 3
permalink: /chapters/appendix-c-comparison-chart.html
---

# Appendix C: 10-Year Size & Budding Comparison Chart

This chart visualizes the approximate 10-year sizes and budding times of the Japanese Maples in our library. The colors represent their typical summer/fall foliage hues.

#{html}

> **Note:** Sizes are estimates based on average growth rates. Actual sizes will vary depending on climate, soil, and care.

---

[← Previous: Appendix B]({{ site.baseurl }}/chapters/appendix-b-kit.html)
MD

File.write(OUTPUT_FILE, markdown)
puts "Chart generated successfully at #{OUTPUT_FILE}"
