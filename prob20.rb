# Project Euler Problem 20: Factorial Digit Sum
# User: jmjacobi
#
# n! means n * (n  1) * ... * 3 * 2 * 1
#
# For example, 10! = 10 * 9 * ... * 3 * 2 * 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
#
# Answer: 648
# Execution time: <1 second

def factorial(num)
  f = 1
  for i in 1..num
    f *= i
  end
  return f
end

def sumDigits(num)
  sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  end
  return sum
end

ans = sumDigits(factorial(100))
puts "The answer is #{ans}"