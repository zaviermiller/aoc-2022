require 'set'

# pretty simple sliding window
def part1
  File.open('input-6.txt').each_line do |line|
    for i in 0..line.length - 4
      chars = Set.new
      for j in i..i+3
        chars.add(line[j])
      end
      if chars.length == 4
        return i+4
      end
    end
  end
end

def part2
  File.open('input-6.txt').each_line do |line|
    for i in 0..line.length - 14
      chars = Set.new
      for j in i..i+13
        chars.add(line[j])
      end
      if chars.length == 14
        return i+14
      end
    end
  end
end




puts part1
puts part2