# Project Euler Problem 28: Number Spiral Diagonals
# User: jmjacobi
#
# Starting with the number 1 and moving to the right in a clockwise direction a
# 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?
#
# Answer: 669171001
# Execution time: 3.2 seconds

start_time = Time.now()

DIM = 1001
$Grid = Array.new(DIM) {Array.new(DIM, 0)}

x = (DIM/2).floor
y = (DIM/2).floor
$Grid[x][y] = 1
direction = "right"
number = 2

while number <= DIM*DIM
  # Update our coordinates
  case direction
  when "right"
    x += 1
    direction = "down" if $Grid[x][y+1] == 0
  when "left"
    x -= 1
    direction = "up" if $Grid[x][y-1] == 0
  when "up"
    y -= 1
    direction = "right" if $Grid[x+1][y] == 0
  when "down"
    y += 1
    direction = "left" if $Grid[x-1][y] == 0
  end

  $Grid[x][y] = number
  number += 1
end

sum = 0
for i in 0...DIM
  sum += $Grid[i][i]
  sum += $Grid[DIM-1-i][i] if (DIM-1-i) != i
end


puts "The sum of the diagonals is #{sum}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

