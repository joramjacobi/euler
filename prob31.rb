# Project Euler Problem 31: Coin Sums
# User: jmjacobi
#
# In England the currency is made up of pound, L, and pence, p, and there are
# eight coins in general circulation:
#    1p, 2p, 5p, 10p, 20p, 50p, L1 (200p), and L2 (200p).
#
# It is possible to make L2 in the following way:
#    1xL1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
#
# How many different ways can L2 be made using any number of coins?
#
# Answer: 73682
# Execution time: <1 second

start_time = Time.now()

TOTAL = 200

$Denoms = [200, 100, 50, 20, 10, 5, 2, 1]

def countCombos(value, offset)
  return 1 if offset == $Denoms.count - 1

  count = 0
  for i in 0..(value/$Denoms[offset]).floor
    count += countCombos(value - i * $Denoms[offset], offset + 1)
  end  

  return count
end

combos = countCombos(TOTAL, 0)
puts "Found #{combos} combinations"

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

