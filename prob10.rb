# Project Euler Problem 10: Summation of Primes
# User: jmjacobi
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#
# Answer: 142913828922
# Execution Time: 54 seconds

LIMIT = 2000000

$Primes = Array.new

# Determine whether the input is prime
def isPrime?(num)
  for p in $Primes
    break if p > Math.sqrt(num)
    if (num % p) == 0
      return false
    end
  end
  return true if num > 1
  return false
end

start_time = Time.now()
sum = 0

for i in 2..LIMIT
  if isPrime? i
    sum += i
    $Primes.push i
  end
end

puts "Sum of primes less than #{LIMIT} is #{sum}."

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"