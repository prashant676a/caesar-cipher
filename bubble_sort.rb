def bubble_sort(array)
    (0...array.length-1).each do |i|
      (0...array.length-1-i).each do |j|
        if array[j] > array[j+1]
          array[j], array[j+1] = array[j+1], array[j]
        end
      end
    end
    return array
  end
  
  sorted_array = bubble_sort([4, 3, 78, 2, 0, 2])
  p sorted_array

  # => [0, 2, 2, 3, 4, 78]
  
