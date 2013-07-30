# Project Euler Problem 22: Names Scores
# User: jmjacobi
#
# Using prob22_names.txt, a 46K text file containing over five-thousand first
# names, begin by sorting it into alphabetical order. Then working out the
# alphabetical value for each name, multiply this value by its alphabetical
# position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 x 53 = 49714.
#
# What is the total of all the name scores in the file?
#
# Answer: 871198282
# Execution time: <1 second

start_time = Time.now()

def name_score(name)
  score = 0
  name.each_byte { |c| score += (c - 64)}
  return score
end

$Names = Array.new
pos = 1
sum = 0

# read the names in the file
File.open('prob22_names.txt', 'r') do |f|
  line = f.gets
  $Names = line.split(",")
end
$Names.each { |a| a.gsub! /"/, ''}
$Names.sort!

$Names.each { |name|
  sum += name_score(name) * pos
  pos += 1
}

puts "Sum of name scores is #{sum}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

