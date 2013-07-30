# Project Euler Problem 37: Truncatable Primes
# User: jmjacobi
#
# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime
# at each stage: 3797, 797, 97, and 7. Similarly we can work from right to 
# left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#
# Answer: 748317
# Execution time: 21.5 seconds

start_time = Time.now()
$Primes = Array.new
TARGET = 11
$Sum = 0
$Count = 0


# Determine whether the input is prime
def isPrime?(num)
  for p in $Primes
    break if p > Math.sqrt(num)
    if (num % p) == 0
      return false
    end
  end
  if num > 1
    $Primes.push num
    return true
  end
  return false
end

def isTruncatableLeft?(p)
  while p > 0
    return false if !$Primes.include?(p)
    p %= 10**(Math.log10(p).floor)
  end
  return true
end
  
def isTruncatableRight?(p)
  while p > 0
    return false if !$Primes.include?(p)
    p /= 10
  end
  return true
end


def isTruncatable?(p)
  return true if isTruncatableLeft?(p) and isTruncatableRight?(p)
  return false
end

def botherTesting?(num)
  while num > 0
    digit = num % 10
    return false if digit == 0 or digit == 4 or digit == 6 or digit == 8
    num /= 10
  end
  return true
end

i = 1
while $Count < TARGET
  if isPrime?(i) and botherTesting?(i) and i > 10
    if isTruncatable?(i)
      $Sum += i 
      $Count += 1
    end
  end
  i += 1
end

puts "Sum = #{$Sum}"


end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

