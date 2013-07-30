# Project Euler Problem 30: Digit Fifth Powers
# User: jmjacobi
#
# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:
#     1634 = 1^4 + 6^4 + 3^4 + 4^4
#     8208 = 8^4 + 2^4 + 0^4 + 8^4
#     9474 = 9^4 + 4^4 + 7^4 + 4^4
#
# As 1^4 = 1 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.
#
# Answer: 443839
# Execution time: 3.8 seconds

start_time = Time.now()

def sumPowersOfDigits(num)
  sum5 = 0
  while num > 0
    sum5 += (num % 10)**5
    num /= 10
  end
  return sum5
end

sum = 0
for i in 2..999999
  sum += i if i == sumPowersOfDigits(i)
end

puts "The sum is #{sum}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

