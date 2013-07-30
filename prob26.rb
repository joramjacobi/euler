# Project Euler Problem 26: Reciprocal Cycles
# User: jmjacobi
#
# A unit fraction contains 1 in the numerator. The decimal representation of
# the unit fractions with denominators 2 to 10 are given:
#   1/2 = 0.5
#   1/3 = 0.(3)
#   1/4 = 0.25
#   1/5 = 0.2
#   1/6 = 0.1(6)
#   1/7 = 0.(142857)
#   1/8 = 0.125
#   1/9 = 0.(1)
#   1/10 = 0.1
#
# Where 0.(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.
#
# Answer: 983
# Execution time: <1 second

start_time = Time.now()

def findRecurring(denominator)
  remainder_list = Array.new
  numerator = 1
  count = 0
  while numerator != 0
    while numerator < denominator
      numerator *= 10
    end

    remainder = numerator % denominator
    
    if remainder_list.include? remainder
      break
    else
      remainder_list.push(remainder)
      count += 1
    end    
    numerator = remainder
  end
  return count
end

max_len = 0
val = 0

for i in 2..999
  len = findRecurring(i)
  if len > max_len
    max_len = len
    val = i
  end
end

puts "#{val} has a recurrence of length #{max_len}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

