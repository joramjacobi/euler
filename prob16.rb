# Project Euler Problem 16: Power Digit Sum
# User: jmjacobi
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits in the number 2^1000?
#
# Answer: 1366
# Execution time: <1 second

def sumDigits(num)
  sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  end
  return sum
end

puts "Sum of digits of 2^1000 is #{sumDigits(2**1000)}."