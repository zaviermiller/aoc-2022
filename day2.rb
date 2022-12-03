# opp: A rock, B paper, C scissors, assume input is byte
# me: X rock, Y paper, Z scissors
def score_for_round(opp_throw, my_throw)
  score = 0
  poss_opp = ["A", "B", "C"]
  poss_me = ["X", "Y", "Z"]
  win = poss_me[(poss_opp.find_index(opp_throw) + 1) % 3] == my_throw
  draw = poss_me[(poss_opp.find_index(opp_throw))] == my_throw

  if win
    score += 6
  elsif draw
    score += 3
  end
  
  score += poss_me.find_index(my_throw) + 1
  score
end

def score_for_round_2(opp_throw, need_status)
  score = 0
  poss_opp = ["A", "B", "C"]

  if need_status == "Z"
    score += 6 + ((poss_opp.find_index(opp_throw) + 1) % 3) + 1
  elsif need_status == "Y"
    score += 3 + poss_opp.find_index(opp_throw) + 1
  elsif need_status == "X"
    score += (poss_opp.find_index(opp_throw) - 1) % 3 + 1
  end


end

def part1
  total_score = 0
  File.open('input-2.txt').each_line do |line|
    opp_throw, my_throw = line.split(" ")
    total_score += score_for_round(opp_throw, my_throw)
  end

  total_score
end

def part2
  total_score = 0
  File.open('input-2.txt').each_line do |line|
    opp_throw, my_throw = line.split(" ")
    total_score += score_for_round_2(opp_throw, my_throw)
  end

  total_score
end

puts part1
puts part2