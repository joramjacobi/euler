# Project Euler Problem 19: Counting Sundays
# User: jmjacobi
#
# You are given the following information, but you may prefer to do some
# research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
#
# A leap year occurs on any year evenly divisible by 4, but not on a century
# unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?
#
# Answer: 171
# Execution time: < 1 second

# 1 January 1901 was a Tuesday.
month = 1
year = 1901
total_days = 2  # %7 == 0 if Sunday
sunday_count = 0

def isLeapYear?(year)
  if year % 400 == 0
    return true
  end
  if year % 100 == 0
    return false
  end
  if year % 4 == 0
    return true
  end
  return false
end

def daysInMonth(month, year)
  case month
  when 4, 6, 9, 11
    return 30
  when 1, 3, 5, 7, 8, 10, 12
    return 31
  when 2
    if isLeapYear?(year)
      return 29
    end
    return 28
  end
  return 0
end

while year < 2001
  days = daysInMonth(month, year)
  total_days = total_days + days
  if total_days % 7 == 0
    sunday_count = sunday_count + 1
  end
  month = month + 1
  if month == 13
    month = 1
    year = year + 1
  end
end
puts "#{sunday_count} Sundays."


