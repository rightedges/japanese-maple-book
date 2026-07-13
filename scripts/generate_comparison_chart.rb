require 'yaml'
require 'fileutils'

CULTIVARS_DIR = File.join(__dir__, '..', '_cultivars')
OUTPUT_FILE = File.join(__dir__, '..', 'chapters', 'appendix-c-comparison-chart.md')

def parse_growth(growth_str)
  if growth_str =~ /(\d+)-(\d+)/
    return ($1.to_f + $2.to_f) / 2.0
  elsif growth_str =~ /Fast/i
    return 15.0
  elsif growth_str =~ /Moderate/i
    return 8.0
  elsif growth_str =~ /Slow/i
    return 4.0
  end
  8.0
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

groups.values.each do |group|
  group.sort_by! { |c| c[:size] }
end

max_size = cultivars.map { |c| c[:size] }.max || 20.0
max_scale = ((max_size / 2.0).ceil * 2)

html = <<-HTML
<style>
.chart-wrapper {
  position: relative;
  width: 100%;
  font-family: sans-serif;
  margin-top: 20px;
}
.chart-header {
  display: flex;
  margin-bottom: 10px;
}
.chart-group-title {
  flex: 1;
  text-align: center;
  font-weight: bold;
  color: #666;
  padding: 5px;
}
.chart-scroll-area {
  overflow-x: auto;
  width: 100%;
  padding-bottom: 20px;
}
.chart-body {
  display: flex;
  position: relative;
  min-width: 1200px; /* ensure enough width to avoid squishing */
}
.chart-y-axis {
  position: absolute;
  right: 0;
  top: 0;
  height: 400px;
  width: 40px;
  border-left: 1px solid #ccc;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background: white; /* overlay on top if scrolled */
  z-index: 10;
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
  top: -8px;
  font-size: 12px;
  color: #666;
  background: white;
  padding-left: 5px;
}
.chart-grid {
  display: flex;
  flex: 1;
  margin-right: 40px; /* space for fixed y-axis */
}
.chart-section {
  flex: 1;
  position: relative;
  display: flex;
  align-items: flex-end;
  justify-content: space-evenly;
  border-right: 1px dashed #ccc;
  border-bottom: 2px solid #ccc;
  padding: 0 10px;
  height: 400px;
}
.chart-section:last-child {
  border-right: none;
}
.plant-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 5px;
}
a.plant-link {
  text-decoration: none;
  color: inherit;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.plant-shape {
  border-radius: 40% 40% 15% 15%;
  box-shadow: inset -5px -5px 10px rgba(0,0,0,0.2);
  transition: transform 0.2s;
  margin-bottom: 0;
}
.plant-shape:hover {
  transform: scale(1.1);
}
.plant-label-container {
  height: 120px;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  margin-top: 10px;
}
.plant-label {
  font-size: 11px;
  writing-mode: vertical-rl;
  text-orientation: mixed;
  transform: rotate(180deg);
  color: #555;
  white-space: nowrap;
}
</style>

<div class="chart-wrapper">
  <div class="chart-scroll-area">
    <div class="chart-header" style="min-width: 1200px; margin-right: 40px;">
      <div class="chart-group-title">EARLY SEASON</div>
      <div class="chart-group-title">MID SEASON</div>
      <div class="chart-group-title">LATE SEASON</div>
    </div>
    
    <div class="chart-body">
      <div class="chart-grid">
HTML

["Early-season", "Mid-season", "Late-season"].each do |g|
  html += "        <div class=\"chart-section\">\n"
  groups[g].each do |c|
    height_px = (c[:size] / max_scale.to_f) * 380
    width_px = [height_px * 0.45, 20].max
    html += <<-ITEM
          <div class="plant-item">
            <a href="#{c[:url]}" class="plant-link" title="#{c[:title]} (10-yr size: #{c[:size].round(1)}')">
              <div class="plant-shape" style="height: #{height_px}px; width: #{width_px}px; background: #{c[:color]};"></div>
              <div class="plant-label-container">
                <div class="plant-label">#{c[:title]}</div>
              </div>
            </a>
          </div>
ITEM
  end
  html += "        </div>\n"
end

html += "      </div>\n"
html += "      <div class=\"chart-y-axis\">\n"

ticks = (0..max_scale).step(2).to_a.reverse
ticks.each do |t|
  html += "        <div class=\"y-tick\"><span>#{t}'</span></div>\n"
end

html += "      </div>\n"
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
