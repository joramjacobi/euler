# Project Euler Problem 4: Largest Palindrome Product
# User: jmjacobi
#
# A palindromic number reads the same both ways. The largest palindrome made 
# from the product of two 2-digit numbers is 9009 = 91 x 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609
# Execution Time: < 1 second


# Determine whether the input is a palindrome
def isPalindrome?(input)
  first = 0
  last = input.length - 1
  while first < last
    if input[first] != input[last]
      return false
    end
    first += 1
    last -= 1
  end
  return true
end

start_time = Time.now()
largestPalindrome = 0
for i in 100...1000
  for j in i...1000
    prod = i*j
    if isPalindrome?(prod.to_s())
      if prod > largestPalindrome
        largestPalindrome = prod
      end
    end
  end
end

puts "The largest palindrome is #{largestPalindrome}."
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"
