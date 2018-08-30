# array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(array)   #bubble sort is O(n^2) time???
  longest_fish = nil
  i = 0
  while i < array.length - 1
    j = i + 1
    while j < array.length
      if array[i].length > array[j].length
        longest_fish = array[i]
      else
        longest_fish = array[j]
      end
      j += 1
    end
    i += 1
  end

  longest_fish
end

def dominant_octopus(array, &prc)   #merge sort - O(n log n) time
    prc ||= Proc.new { |x, y| x.length <=> y.length }
    return array if array.count <= 1

    midpoint = array.length / 2
    sorted_left = dominant_octopus(array.take(midpoint), &prc)
    sorted_right = dominant_octopus(array.drop(midpoint), &prc)

    merge(sorted_left, sorted_right, &prc)

end

def merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged + left + right
end


def clever_octopus(array)    #O(n) time aka linear search, go through array 1x
  longest_fish_length = 0
  longest_fish = array[0]

  array.each do |fish|
    if fish.length > longest_fish_length
      longest_fish_length = fish.length
      longest_fish = fish
    end
  end
  longest_fish
end
