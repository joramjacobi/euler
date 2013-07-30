# Project Euler Problem 14: Longest Collatz Sequence
# User: jmjacobi
#
# The following iterative sequence is defined for the set of positive integers:
#   n -> n/2 (n is even)
#   n -> 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#   13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#
# Answer: 837799
# Execution time: 7.5 seconds

$Term_Counts = Hash.new

# Returns the next term in the sequence
def getNext(num)
  return (num % 2) == 0 ? num/2 : 3*num + 1
end

# Returns the number of terms resulting from the current number
# Adds new numbers to the array of term counts
def getSeqCount(num)
  if num == 1
    count = 1
  elsif $Term_Counts[num]
    count = $Term_Counts[num]
  else
    count = 1 + getSeqCount(getNext(num))
    $Term_Counts[num] = count
  end
  return count
end


start_time = Time.now()

max_num_terms = 0
max_num_terms_source = 0

i = 3
while i < 1000000
  num_terms = getSeqCount(i)
  
  if num_terms > max_num_terms
    max_num_terms = num_terms
    max_num_terms_source = i
  end

  i += 2
end

puts "#{max_num_terms_source} gives us #{max_num_terms} terms."

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"
