# Project Euler Problem 21: Amicable Numbers
# User: jmjacobi
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
#
# Answer: 31626
# Execution time: 1.2 seconds

$Amicables = Array.new

def sumDivisors(num)
  i = 2
  sum = 1
  while i <= Math.sqrt(num).floor
    if i == Math.sqrt(num)
      sum += i
    elsif (num % i) == 0
      sum += i
      sum += num/i
    end
    i += 1
  end
  return sum
end

start_time = Time.now()

num = 1
while num < 10000
  partner = sumDivisors(num)
  if partner != num
    compare = sumDivisors(partner)
    if num == compare
      $Amicables.push num
      $Amicables.push partner
    end
  end
  num += 1
end

sum = $Amicables.inject(:+)
puts "Sum = #{sum}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

