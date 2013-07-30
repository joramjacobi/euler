# Project Euler Problem 38: Pandigital Multiples
# User: jmjacobi
#
# Take the number 192 and multiply it be each of 1, 2, and 3:
#     192 x 1 = 192
#     192 x 2 = 384
#     192 x 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We
# will call 192384576 the concatenated product of 192 and (1, 2, 3).
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, 
# and 5, giving the pandigital, 918273645, which is the concatenated product of
# 9 and (1, 2, 3, 4, 5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as
# the concatenated product of an integer with (1, 2, ..., n) where n > 1?
#
# Answer: 932718654
# Execution time: <1 second

start_time = Time.now()
$MaxPD = 918273645

def numDigits (a)
  count = 0
  while a > 0
    count += 1
    a /= 10
  end
  return count
end

def append(num, a)
  ret = num.to_s() + a.to_s()
  return ret.to_i()
end

def isPandigital? a
  digits = Array.new

  while a > 0
    digit = a % 10
    return false if digit == 0
    return false if digits.include? digit
    digits.push digit
    a /= 10
  end

  return digits.count == 9
end

for i in 1..9999
  num = i
  n = 1
  while numDigits(num) < 9
    n += 1
    num = append(num, i*n)
  end

  $MaxPD = num if num > $MaxPD and isPandigital?(num)
end

puts "Found max number: #{$MaxPD}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

