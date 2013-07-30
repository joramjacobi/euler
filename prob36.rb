# Project Euler Problem 36: Double-base Palindromes
# User: jmjacobi
#
# The decimal number, 585 = 1001001001b, is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in 
# base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include
# leading zeros.)
#
# Answer: 872187
# Execution time: 1 second

start_time = Time.now()

$Sum = 0

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



for i in 1...1000000
  $Sum += i if i % 2 != 0 and isPalindrome?(i.to_s()) and isPalindrome?(i.to_s(2))
end

puts "Sum = #{$Sum}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

