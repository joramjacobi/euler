# Project Euler Problem 27: Quadratic Primes
# User: jmjacobi
#
# Euler discovered the remarkable quadratic formula:
#
# n² + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive
# values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is
# divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly
# divisible by 41.
#
# The incredible formula  n² - 79n + 1601 was discovered, which produces 80
# primes for the consecutive values n = 0 to 79. The product of the
# coefficients, -79 and 1601, is -126479.
#
# Considering quadratics of the form:
#
# n² + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |-4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression
# that produces the maximum number of primes for consecutive values of n,
# starting with n = 0.
#
# Answer: -59231
# Execution time: 15.9 seconds


start_time = Time.now()

# Determine whether the input is prime
def isPrime?(num)
  return false if num <= 1

  i = 2
  while i <= (Math.sqrt(num)).floor
    if (num % i) == 0
      return false
    end
    i += 1
  end  

  return true
end

def calc_quadratic (a, b, n)
  return n*n + a*n + b
end

max_seq_len = 0
max_seq_a = 0
max_seq_b = 0

for a in -999..999
  for b in -999..999
    n = 0
    len = 0
    while isPrime?(calc_quadratic(a, b, n))
      len += 1
      n += 1
    end

    if len > max_seq_len
      max_seq_len = len
      max_seq_a = a
      max_seq_b = b
    end
  end
end

puts "Max sequence: n*n + #{max_seq_a}*n + #{max_seq_b} gives #{max_seq_len} primes"
puts "Product = #{max_seq_a*max_seq_b}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

