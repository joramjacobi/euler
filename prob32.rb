# Project Euler Problem 32: Pandigital Products
# User: jmjacobi
#
# We shall say that an n-digit number is pandigital if it makes use of all the 
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 
# through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained more than one way so be sure to only
# include it once in your sum.
#
# Answer: 45228
# Execution time: <1 second

start_time = Time.now()

$Products = Array.new

def isPandigital? x
  digits = Array.new

  x.each { |a|
    while a > 0
      digit = a % 10
      return false if digit == 0
      return false if digits.include? digit
      digits.push digit
      a /= 10
    end
  }

  return digits.count == 9
end

for i in 1..9876
  for j in i..(9999/i).floor
    $Products.push i*j if isPandigital?([i, j, i*j])
  end
end

$Products.uniq!
sum = $Products.inject(:+)
puts "The sum of products is #{sum}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

