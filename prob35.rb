# Project Euler Problem 35: Circular Primes
# User: jmjacobi
#
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100:
#   2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
#
# Answer: 55
# Execution time: 2.2 seconds

# Except for 2 and 5, these numbers cannot contain even digits or 5.

start_time = Time.now()

$Primes = Array.new
$CircPrimes = Array.new

# Determine whether the input is prime
def isPrime?(num)
  i = 2
  while i <= (Math.sqrt(num)).floor
    if (num % i) == 0
      return false
    end
    i += 1
  end  
  return true if num > 1
  return false
end

def botherTesting?(num)
  return true if num <= 7

  while num > 0
    digit = num % 10
    return false if digit == 0 or digit == 2 or digit == 4 or digit == 5 or digit == 6 or digit == 8
    num /= 10
  end
  return true
end

def shiftNum(num)
  return num/10 + (num % 10) * 10**(Math.log10(num).floor)
end

def isCircularPrime?(num)
  test = shiftNum(num)
  
  while test != num
    return false if !$Primes.include?(test)
    test = shiftNum(test)
  end

  return true
end

# Find all primes less than one million that do not contain disqualifying digits
for i in 2...1000000
  if botherTesting?(i)
    $Primes << i if isPrime?(i)
  end
end
puts "Prime list calculated"
puts "Primes count = #{$Primes.count}"

$Primes.each { |p|
  $CircPrimes.push(p) if isCircularPrime?(p)
}

puts "Found #{$CircPrimes.count} circular primes"
p $CircPrimes

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

