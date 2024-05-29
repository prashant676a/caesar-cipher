def substrings(string, dictionary)
    result = Hash.new(0)
    downcased_string = string.downcase    
    dictionary.each do |word|
        start_index = 0
        while (index = downcased_string.index(word, start_index))
            result[word] += 1
            start_index = index + 1
        end
    end    
    result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"
result = substrings string, dictionary
puts result
