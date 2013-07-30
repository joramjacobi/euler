# Project Euler Problem 6: Sum Square Difference
# User: jmjacobi
#
# The sum of the squares of the first ten natural numbers is,
#     1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
#     (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural 
# numbers and the square of the sum is 3025 - 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred 
# natural numbers and the square of the sum.
# 
# Answer: 25164150
# Execution Time: <1 second

def sumOfSquares(n)
  sum = 0
  for i in 1..n
    sum += i**2
  end
  return sum
end

def squareOfSum(n)
  sum = 0
  for i in 1..n
    sum += i
  end
  return sum**2
end
  
num = 100
x1 = squareOfSum(num)
x2 = sumOfSquares(num)
answer = x1 - x2
puts "The difference between #{x1} and #{x2} is #{answer}"