def caesar_cipher string, shift_val
    new_str = ''
    string.each_char {|val| new_str<<shift_char(val, shift_val)}
    new_str
end

#method to shift a character
def shift_char(char, shift_amount)
    if char.match?(/[A-Z]/)
      base = 'A'.ord
      shifted_value = (char.ord - base + shift_amount) % 26 + base
      shifted_char = shifted_value.chr
    elsif char.match?(/[a-z]/)
      base = 'a'.ord
      shifted_value = (char.ord - base + shift_amount) % 26 + base
      shifted_char = shifted_value.chr
    else
      shifted_char = char
    end
    shifted_char
end

puts caesar_cipher("Hello",3)