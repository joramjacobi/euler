# Project Euler Problem 25: 1000-digit Fibonacci Number
# User: jmjacobi
#
# The Fibonacci sequence is defined by the recurrence relation:
#  Fn = F(n-1) + F(n-2) where F1 = 1 and F2 = 1
#
# Hence the first 12 terms will be:
#  F1 = 1
#  F2 = 1
#  F3 = 2
#  F4 = 3
#  F5 = 5
#  F6 = 8
#  F7 = 13
#  F8 = 21
#  F9 = 34
#  F10 = 55
#  F11 = 89
#  F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the first term in the Fibonacci sequence to contain 1000 digits?
#
# Answer: 4782
# Execution time: <1 second

start_time = Time.now()

a = 1
b = 1
term_num = 2

while b < 10**999
  c = a + b
  a = b
  b = c
  term_num += 1
  # At this point, the term number is the value in b.
end

puts "Term number #{term_num}"
end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

