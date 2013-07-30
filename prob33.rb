# Project Euler Problem 33: Digit Canceling Fractions
# User: jmjacobi
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which
# is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less 
# than one in value, and containing two digits in the numerator and
# denominator.
#
# If the product of these four fractions is given in its lowest common terms, 
# find the value of the denominator.
#
# Answer: 100
# Execution time: <1 second

start_time = Time.now()

$Num = 1
$Denom = 1

def isCurious?(num, denom)
  # Check for form ab/bc
  if (num % 10 == (denom/10).floor) and (denom % 10 != 0)
    return true if ((num/10).floor).to_f/(denom % 10) == num.to_f/denom
  end

  # Check for form ab/ca
  if (num/10).floor == denom % 10
    return true if (num % 10).to_f/((denom/10).floor) == num.to_f/denom
  end

  return false
end


for i in 10..99
  for j in (i+1)..99
    if isCurious?(i, j)
      $Num *= i
      $Denom *= j
    end
  end
end

i = 2
while i <= $Num
  while ($Num % i == 0) and ($Denom % i == 0)
    $Num /= i
    $Denom /= i
  end  
  i += 1
end

puts "Simplified: #{$Num}/#{$Denom}"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

