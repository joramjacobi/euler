# Project Euler Problem 7: 10001st Prime
# User: jmjacobi
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
# 
# What is the 10001st prime number?
#
# Answer: 104743
# Execution Time: 1.2 seconds

TARGET = 10001

$Primes = Array.new

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

# Determine whether the input is prime
def isPrimeOld?(num)
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

def factorial(num)
  f = 1
  for i in 1..num
    f *= i
  end
  return f
end

def isPrimeAlt?(num)
  x = Factorial(num - 1) + 1
  return ((x % num) == 0)
end

start_time = Time.now()
count = 0
i = 2
while 1
  count += 1 if isPrime? i
  break if count == TARGET
  i += 1
end

puts "Prime number #{TARGET} is #{i}"
end_time = Time.now()

puts "Execution Time: #{end_time - start_time} seconds"