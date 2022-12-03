require 'set'

def add_to_total(char)
  val = 0
  if char > "a".ord
    val = char - "a".ord + 1
  elsif char > "A".ord
    val = char - "A".ord + 27
  end

  val
end

def part1
  in_both_compartments = []
  total = 0
  File.open('input-3.txt').each_line do |line|
    compartment_divider = line.length / 2
    first_half = line[0..compartment_divider - 1]
    second_half = line[compartment_divider..-1]

    first_half_set = Set.new
    both_set = Set.new
    first_half.each_byte do |char|
      first_half_set.add(char)
    end

    second_half.each_byte do |char|
      if first_half_set.include?(char)
        both_set.add(char)
      end
    end

    both_set.each do |char|
      total += add_to_total(char)
    end
  end

  total
end

def part2
  total = 0
  File.foreach('input-3.txt').each_slice(3) do |line1, line2, line3|
    set_1 = Set.new
    set_2 = Set.new

    line1.each_byte do |char|
      set_1.add(char)
    end

    line2.each_byte do |char|
      if (set_1.include?(char))
        set_2.add(char)
      end
    end

    line3.each_byte do |char|
      if (set_2.include?(char))
        total += add_to_total(char)
        break
      end
    end
  end
  total
end

puts part1
puts part2