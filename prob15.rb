# Project Euler Problem 15: Lattice Paths
# User: jmjacobi
#
# Starting in the top left corner of a 22 grid, and only being able to move to
# the right and down, there are exactly 6 routes to the bottom right corner.
#
# How many such routes are there through a 20x20 grid?
#
# Answer: 137846528820
# Execution time: <1 second

# A 20x20 grid has 21x21 nodes

nodes = Array.new(21) { Array.new(21) }

for i in 0..20
  for j in 0..20
    if i == 0 or j == 0
      nodes[i][j] = 1
    else
      nodes[i][j] = nodes[i][j-1] + nodes[i-1][j]
    end
  end
end

puts "Number of paths is #{nodes[20][20]}"

