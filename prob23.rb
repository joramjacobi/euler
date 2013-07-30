# Project Euler Problem 23: Non-Abundant Sums
# User: jmjacobi
#
# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.
#
# Answer: 4179871
# Execution time: 6.2 seconds

start_time = Time.now()
# Knowledge collected from http://mathworld.wolfram.com/AbundantNumber.html
LIMIT = 20161 

$Abundants = Array.new
$AbundantSums = Array.new(LIMIT*2+1, false)

def isAbundant?(num)
  i = 2
  sum = 1
  for i in 2..Math.sqrt(num).floor
    if (num % i) == 0
      sum += i
      sum += num/i if (i < num/i)
    end
    return true if sum > num
  end
  return false
end

# Start by finding all the abundant numbers less than our limit
i = 1
while i <= LIMIT - 10
  if isAbundant?(i)
    $Abundants.push i
  end
  i += 1
end

for a in $Abundants
  for b in $Abundants
    if b > a
      break
    end
    $AbundantSums[a+b] = true
  end
end

sum = 0
for i in 1..LIMIT
  if !$AbundantSums[i]
    sum += i
  end
end

puts "Sum is #{sum}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

