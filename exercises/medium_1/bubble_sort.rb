def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      elsif array[index - 1] <= array[index]
        next
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

# Further Explration:
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        map_val1 = yield(array[index - 1])
        map_val2 = yield(array[index])
        next if map_val1 <= map_val2
        
      elsif array[index - 1] <= array[index]
        next
      end
      
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end