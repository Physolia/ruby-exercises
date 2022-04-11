def merge_sort(array)
  if array.size < 2
    array
  else
    left = merge_sort(array.slice!(0..(array.size / 2) - 1))
    right = merge_sort(array)
    merge(left, right)
  end
end

def merge(left, right, merged_array = [])
  until left.empty? && right.empty?
    if left.empty?
      return merged + right
    elsif right.empty?
      return merged + left
    else
      left[0] < right[0] ? merged_array << left.shift : merged_array << right.shift
    end
  end
  merged_array
end

arr = []
rand(185).times do
  arr << rand(185)
end

puts merge_sort(arr)