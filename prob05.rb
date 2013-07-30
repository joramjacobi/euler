# Project Euler Problem 5: Smallest Multiple
# User: jmjacobi
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 
# to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the 
# numbers from 1 to 20?
#
# Answer: 232792560
# Execution Time: <1 second

# Find the prime factors of the given number
def findFactors(number)
  factors = Array.new
  i = 2
  while i <= number
    if (number % i) == 0
      while (number % i) == 0
        factors.push(i)
        number /= i
      end
    end
    i += 1
  end  
  return factors
end

def arrayToHash(input)
  output = Hash.new(0)
  input.each {|a| output[a] = output[a] + 1}
  return output
end

all_prime_factors = Hash.new(0)

for i in 2..20
  factors = findFactors(i)
  factors_count = arrayToHash(factors)
  factors_count.each_key {|a| all_prime_factors[a] = factors_count[a] if factors_count[a] > all_prime_factors[a]}
end

product = 1
all_prime_factors.each {|x, exp| product *= (x**exp)}
puts "Smallest multiple = #{product}"