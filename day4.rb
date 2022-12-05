def get_pair_ranges(ranges)
  ranges.map do |range|
    n1, n2 = range.split('-').map(&:to_i)
    n2 - n1
  end

end

def part1
  total = 0
  File.open('input-4.txt').each_line do |line|
    ranges = line.split(',')
    r1_start, r1_end = ranges[0].split('-').map(&:to_i)
    r2_start, r2_end = ranges[1].split('-').map(&:to_i)

    if (r1_start >= r2_start && r1_end <= r2_end) || (r2_start >= r1_start && r2_end <= r1_end)
      total += 1
    end

  end
  total
end

def part2
  total = 0
  File.open('input-4.txt').each_line do |line|
    ranges = line.split(',')
    r1_start, r1_end = ranges[0].split('-').map(&:to_i)
    r2_start, r2_end = ranges[1].split('-').map(&:to_i)

    if (r1_start >= r2_start && r1_start <= r2_end) || (r2_start >= r1_start && r2_start <= r1_end)
      total += 1
    end

  end
  total
end

puts part1
puts part2