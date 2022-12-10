# Your puzzle answer was 71780.
#
# The first half of this puzzle is complete! It provides one gold star: *
#
# --- Part Two --- By the time you calculate the answer to the Elves' question,
# they've already realized that the Elf carrying the most Calories of food
# might eventually run out of snacks.
#
# To avoid this unacceptable situation, the Elves would instead like to know
# the total Calories carried by the top three Elves carrying the most Calories.
# That way, even if one of those Elves runs out of snacks, they still have two
# backups.
#
# In the example above, the top three Elves are the fourth Elf (with 24000
# Calories), then the third Elf (with 11000 Calories), then the fifth Elf (with
# 10000 Calories). The sum of the Calories carried by these three elves is
# 45000.
#
# Find the top three Elves carrying the most Calories. How many Calories are
# those Elves carrying in total?
#
str = File.read("day1-puzzle.txt")

# str = "
# 7769
# 6798
# 11685
# 10826
# 11807
# 5786
# 7932
#
# 54883
# "
#
top_3 = []

str.tap do
  str.split("\n\n")
     .map { |t| t.gsub(/\n/, ' ') }
     .map { |t| t.split }
     .map { |t| t.map(&:to_i) }
     .map { |t| t.reduce(&:+) }
     .tap { |x| 3.times { |_| top_3 << x.max && x.delete(x.max) } }
end

puts top_3.sum