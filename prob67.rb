# Project Euler Problem 67: Maximum Path Sum II
# User: jmjacobi
#
# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.
#
#       3
#      7 4
#     2 4 6
#    8 5 9 3
#
# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom in prob67_triangle.txt, a 15K text 
# file containing a triangle with one-hundred rows.
#
# Answer: 7273
# Execution time: <1 second

dim = 100

triangle = Array.new(dim)
max_sums = Array.new(dim) { Array.new(dim) }


# read our triangle from the file
File.open('prob67_triangle.txt', 'r') do |f|
  c = 0
  while line = f.gets
    triangle[c] = line.split(" ").map { |s| s.to_i }
    c = c+1
  end
end

(dim-1).downto(0) { |row|
  for i in 0..row
    if row == dim-1
      max_sums[row][i] = triangle[row][i]
    else
      max_sums[row][i] = triangle[row][i] + [max_sums[row+1][i], max_sums[row+1][i+1]].max
    end
  end
}
puts "The answer is #{max_sums[0][0]}."
