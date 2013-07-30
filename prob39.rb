# Project Euler Problem 39: Integer Right Triangles
# User: jmjacobi
#
# If p is the perimeter of a right angle triangle with integral length sides,
# {a, b, c}, there are exactly three solutions for p = 120:
#     {20, 48, 52}, {24, 45, 51}, {30, 40, 50}
#
# For which value of p <= 1000, is the number of solutions maximised?
#
# Answer: 840
# Execution time: 30.7

start_time = Time.now()

$MaxNum = 0
$MaxNumP = 0

# a is the short leg, b the long, c the hypoteneus (sp?)
for p in 1..1000
  count = 0
  for a in 1..(p/3).floor
    for b in (a+1)..(((2*p)/3) + 1 - a)
      c = p - a - b
      if a**2 + b**2 == c**2
        count += 1
      end
    end
  end
  if count > $MaxNum
    $MaxNum = count
    $MaxNumP = p
  end
end

puts "#{$MaxNumP} has #{$MaxNum} solutions."

end_time = Time.now()
puts "Execution Time: #{end_time - start_time} seconds"

