# Project Euler Problem 40: Champernowne's Constant
# User: jmjacobi
#
# An irrational decimal fraction is created by concatenating the positive
# integers:
#   0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the
# following expression.
#   d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000
#
# Answer: 210
# Execution time: <1 second

start_time = Time.now()
$N = [1, 10, 100, 1000, 10000, 100000, 1000000]
$Prod = 1

def numDigits (a)
  count = 0
  while a > 0
    count += 1
    a /= 10
  end
  return count
end

def getDigit(num, offset)
  total = numDigits(num)
  if total <= offset
    puts "Requesting too large of an offset (#{offset} for #{num})"
    return 0
  end
  div = total - offset - 1
  while div > 0
    num /= 10
    div -= 1
  end

  return num % 10
end

i = 1
total_num_digits = 0
cur_target = 0

while 1
  cur_num_digits = numDigits(i)
  if total_num_digits + cur_num_digits >= $N[cur_target]
    multiplier = getDigit(i, $N[cur_target] - total_num_digits - 1)
    $Prod *= multiplier

    cur_target += 1
    break if cur_target >= $N.count
  end

  # Update our "number"
  total_num_digits += cur_num_digits
  i += 1
end

puts "Product = #{$Prod}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

