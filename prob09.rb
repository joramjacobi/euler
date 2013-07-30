# Project Euler Problem 9: Special Pythagorean Triplet
# User: jmjacobi
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#    a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Answer: 31875000
# Execution Time: <1 second

SUM = 1000

# Since a is less than b and c, a can be no larger than 1/3 of our desired sum
for a in 1..(SUM/3)
  # Since b is less than c, b can be no larger than 1/2 of the remaining sum
  for b in (a+1)..((SUM-a)/2)
    c = SUM - a - b
    sq_ab = a * a + b * b
    sq_c = c * c
    
    if sq_ab == sq_c
      product = a * b * c
      puts "Found triple! #{a} #{b} #{c}"
      puts "Product = #{product}"
    end
  end
end
