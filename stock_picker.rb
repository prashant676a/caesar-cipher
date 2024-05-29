rates = [17, 3, 6, 9, 15, 8, 6, 1, 10]
max_diff = 0
min_index = -1
max_index = -1

(0...rates.length-1).each do |i|
  (i+1...rates.length).each do |j|
    if rates[i] < rates[j]
        diff = rates[j] - rates[i]
        if diff > max_diff
            max_diff = diff
            min_index = i
            max_index = j
        end
    end
  end
end

puts max_diff, min_index, max_index
