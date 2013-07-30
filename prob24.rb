# Project Euler Problem 24: Lexicographic Permutations
# User: jmjacobi
#
# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits:
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
#
# Answer: 2783915460
# Execution time: <1 second

start_time = Time.now()

def countPermutations(digit)
  ans = 1
  for i in 1...digit
    ans *= i
  end
  return ans
end

digits_list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

total = 1000000 - 1 # Zero based
answer = 0

while !digits_list.empty?
  increment = countPermutations(digits_list.count)
  offset = (total/increment).floor
  total -= offset * increment
  answer += digits_list[offset] * 10**(digits_list.count - 1)
  digits_list.delete_at(offset)
end

puts "The answer is #{answer}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

