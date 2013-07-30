# Project Euler Problem 3: Largest Prime Factor
# User: jmjacobi
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143?
#
# Answer: 6857
# Execution Time: <1 second

myNumber = 600851475143

# Find the prime factors of the given number
def findFactors(number)
  factors = Array.new
  puts "Prime factors of #{number}:"
  i = 2
  while i <= number
    if (number % i) == 0
      factors.push(i)
      puts "#{i}"
      while (number % i) == 0
        number /= i
      end
    end
    i += 1
  end  
  return factors
end

myFactors = findFactors(myNumber)
puts "The largest prime factor of #{myNumber} is #{myFactors.last}."