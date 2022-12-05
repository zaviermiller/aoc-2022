
def parse_stacks(input)
  stacks = Array.new(9) { Array.new }
  input.each_line do |line|
    for i in 0..8
      char = line[1 + (i*4)]
      if char != " "
        stacks[i].unshift(char)
      end
    end
  end

  stacks
end

def part1
  res = 0
  crate_input = ""
  done_with_crates = false
  crate_stacks = nil
  File.open('input-5.txt').each_line do |line|
    if line[1] == "1"
      done_with_crates = true
      crate_stacks = parse_stacks(crate_input)
      next
    end
    if !done_with_crates
      crate_input += line
    else
      split_line = line.split(" ")
      crate_num = split_line[1].to_i
      crate_from = split_line[3].to_i - 1
      crate_to = split_line[5].to_i - 1
      i = 0
      while i < crate_num
        tmp = crate_stacks[crate_from].pop
        crate_stacks[crate_to].push(tmp)
        i += 1
      end
    end

  end
  crate_stacks.map { |stack| stack[-1]}.join("")
end

def part2
  res = 0
  crate_input = ""
  done_with_crates = false
  crate_stacks = nil
  File.open('input-5.txt').each_line do |line|
    if line[1] == "1"
      done_with_crates = true
      crate_stacks = parse_stacks(crate_input)
      next
    end
    if !done_with_crates
      crate_input += line
    else
      split_line = line.split(" ")
      crate_num = split_line[1].to_i
      crate_from = split_line[3].to_i - 1
      crate_to = split_line[5].to_i - 1
      i = 0
      tmp_arr = []
      while i < crate_num
        tmp = crate_stacks[crate_from].pop
        tmp_arr.unshift(tmp)


        i += 1
      end
      crate_stacks[crate_to].push(*tmp_arr)
    end

  end
  crate_stacks.map { |stack| stack[-1]}.join("")
end



puts part1
puts part2