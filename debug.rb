require 'yaml'
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
def parse_mature_size(habit_str)
  if habit_str =~ /\((\d+(?:\.\d+)?)-(\d+(?:\.\d+)?)'\)/
    return ($1.to_f + $2.to_f) / 2.0
  elsif habit_str =~ /\((\d+(?:\.\d+)?)'\)/
    return $1.to_f
  end
  nil
end
Dir.glob('_cultivars/*.md').each do |file|
  content = File.read(file, encoding: 'UTF-8')
  if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    frontmatter = YAML.safe_load($1)
    if frontmatter['title'] =~ /Murasaki/i
      inches = parse_growth(frontmatter['growth_rate'].to_s)
      sz = (inches * 10) / 12.0
      mat = parse_mature_size(frontmatter['habit'].to_s)
      puts "#{frontmatter['title']}: original 10yr=#{sz}, mature=#{mat}, habit=#{frontmatter['habit']}"
    end
  end
end
