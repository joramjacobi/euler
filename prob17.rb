# Project Euler Problem 17: Number Letter Counts
# User: jmjacobi
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out 
# in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 
# letters. The use of "and" when writing out numbers is in compliance with 
# British usage.
#
# Answer: 21124
# Execution time: <1 second

letter_counts = {0 => '',
                 1 => 'one', 
                 2 => 'two',
                 3 => 'three',
                 4 => 'four',
                 5 => 'five',
                 6 => 'six',
                 7 => 'seven',
                 8 => 'eight',
                 9 => 'nine',
                 10 => 'ten',
                 11 => 'eleven',
                 12 => 'twelve',
                 13 => 'thirteen',
                 14 => 'fourteen',
                 15 => 'fifteen',
                 16 => 'sixteen',
                 17 => 'seventeen',
                 18 => 'eighteen',
                 19 => 'nineteen',
                 20 => 'twenty',
                 30 => 'thirty',
                 40 => 'forty',
                 50 => 'fifty',
                 60 => 'sixty',
                 70 => 'seventy',
                 80 => 'eighty',
                 90 => 'ninety',
                 100 => 'hundred',
                 1000 => 'thousand'}

count = 0
for i in 1..1000
  if (i % 100) == 0
    # nothing to be done
  elsif (i % 100) < 20
    count += letter_counts[i % 100].length
    if i > 100
      count += 'and'.length
    end
  else
    #add length of ones digit
    count += letter_counts[i % 10].length

    #add length of tens digit
    count += letter_counts[i % 100 - i % 10].length

    if i > 100
      count += 'and'.length
    end
  end

  if i == 1000
    count += letter_counts[1].length
    count += letter_counts[1000].length
  elsif i >= 100
    count += letter_counts[(i/100).floor].length
    count += letter_counts[100].length
  end
end

puts "Character count is #{count}."