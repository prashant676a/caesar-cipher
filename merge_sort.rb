def merge_sort(array)
  return array if array.length==1
  middle = array.length / 2
  merge merge_sort(array[0...middle]),merge_sort(array[middle..-1])
end

def merge left, right
  result = []
  until left.length == 0 or right.length == 0 do
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

arr = [1,6,3,8,22,3,11,24,54,68,79,80,98,65,46,76,53]
p merge_sort(arr)
