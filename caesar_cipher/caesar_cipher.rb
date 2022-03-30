def caesar_cipher(message, shift, result = '')
  message.each_char do |char|
    base = char.ord < 91 ? 65 : 97
    # Modifies the Lowercase & Uppercase
    if char.ord.between?(65, 90) || char.ord.between?(97, 122)
      rotation = (((char.ord - base) + shift) % 26) + base
      result += rotation.chr
    # Keeps spaces & punctuation
    else
      result += char
    end
  end
  result
end

top_cipher_message = caesar_cipher("What a string!", 5)
puts top_cipher_message