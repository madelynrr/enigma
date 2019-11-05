require './lib/cipher_module'

class Decrypt
  include Cipher

  attr_reader :cipher, :key, :date, :alphabet

  def initialize(cipher, key, date)
    @cipher = cipher
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
  end

  def test_key_is_valid(key)
    if key.class == String && key.chars.length == 5 && key.count("0123456789") == 5
      Key.new(key)
    else
      "Invalid Key"
    end
  end

  def test_date_is_valid(date)
    if date.class == String && date.chars.length == 6 && date.count("0123456789") == 6
      Offset.new(date)
    else
      "Invalid Date"
    end
  end

  def rotate_array(letters, final_shifts)
    letters.map.with_index do |letter, index|
      if alphabet.include?(letter)
        @alphabet.rotate(@alphabet.index(letter) - final_shifts[index]).first
      else
        letter
      end
    end
  end

  def decrypt_message
    x = final_shifts(@key, @date)
    y = shift_message_arrays(message_to_arrays(@cipher), x)
    {
    decryption: y,
    key: @key,
    date: @date
    }
  end

end
