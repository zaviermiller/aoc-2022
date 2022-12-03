def part1
  count = 0
  most = 0
  File.open('input-1.txt').each_line do |line|
    # check if line empty
    if line.strip.empty?
      most = count if count > most
      count = 0
    else
      count += line.to_i
    end
  end

  return most
end

def part2
  count = 0
  most = 0
  second_most = 0
  third_most = 0
  File.open('input-1.txt').each_line do |line|
    # check if line empty
    if line.strip.empty?
      if count > most
        third_most = second_most
        second_most = most
        most = count
      elsif count > second_most
        third_most = second_most
        second_most = count
      elsif count > third_most
        third_most = count
      end
      count = 0
    else
      count += line.to_i
    end
  end
  return most + second_most + third_most
end

puts part1
puts part2