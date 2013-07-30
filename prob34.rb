# Project Euler Problem 34: Digit Factorials
# User: jmjacobi
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of 
# their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
# Answer: 40730
# Execution time: 19.4 seconds

start_time = Time.now()

$TotalSum = 0
$Facts = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

def factorial(num)
  return $Facts[num]
end


def sumDigitFactorials(num)
  sum  = 0  
  while num > 0
    sum += factorial(num % 10)
    num /= 10
  end
  return sum
end



for i in 10..362880*9
  $TotalSum += i if i == sumDigitFactorials(i)
end

puts "Found sum: #{$TotalSum}"


end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

