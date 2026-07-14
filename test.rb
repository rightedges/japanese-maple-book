habit_str = "Spreading Dwarf (3-4')"
if habit_str =~ /\((\d+(?:\.\d+)?)-(\d+(?:\.\d+)?)'\)/
  puts "Matched! #{($1.to_f + $2.to_f) / 2.0}"
else
  puts "No match"
end
