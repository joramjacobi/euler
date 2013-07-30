# Project Euler Problem 1: Multiples of 3 and 5
# User: jmjacobi
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# Answer: 233168
# Execution Time: <1 second

# Return true if the input is a multiple of 3 or 5
def isMultipleOf3or5?(i)
  if i % 3 == 0
    return true
  elsif i % 5 == 0
    return true
  else
    return false
  end
end

sum = 0
for i in 1...1000
  if isMultipleOf3or5?(i)
    sum = sum + i
  end
end

puts "Final sum is #{sum}"
