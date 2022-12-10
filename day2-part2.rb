# X means you need to lose,
# Y means you need to end the round in a draw,
# Z means you need to win.

guide = File.read("day2-puzzle.txt")

list = guide.gsub(/^\n/, '')
            .split("\n")
            .map(&:split)

result_score = list.map do |_, y|
  case y
  when "X" then 0
  when "Y" then 3
  when "Z" then 6
  end
end

self_score_mapping =
  {
    "X-A": "Z",
    "X-B": "X",
    "X-C": "Y",
    "Y-A": "X",
    "Y-B": "Y",
    "Y-C": "Z",
    "Z-A": "Y",
    "Z-B": "Z",
    "Z-C": "X"
  }

self_score = list.map { |a, b| self_score_mapping[:"#{b}-#{a}"] }
                 .map do |y|
                   case y
                   when "X" then 1
                   when "Y" then 2
                   when "Z" then 3
                   end
                 end

puts self_score.sum + result_score.sum

# --- Part Two --- The Elf finishes helping with the tent and sneaks back over
# to you. "Anyway, the second column says how the round needs to end: X means
# you need to lose, Y means you need to end the round in a draw, and Z means
# you need to win. Good luck!"
#
# The total score is still calculated in the same way, but now you need to
# figure out what shape to choose so the round ends as indicated. The example
# above now goes like this:
#
# In the first round, your opponent will choose Rock (A), and you need the
# round to end in a draw (Y), so you also choose Rock. This gives you a score
# of 1 + 3 = 4. In the second round, your opponent will choose Paper (B), and
# you choose Rock so you lose (X) with a score of 1 + 0 = 1. In the third
# round, you will defeat your opponent's Scissors with Rock for a score of 1 +
# 6 = 7. Now that you're correctly decrypting the ultra top secret strategy
# guide, you would get a total score of 12.
#
# Following the Elf's instructions for the second column, what would your total
# score be if everything goes exactly according to your strategy guide?
