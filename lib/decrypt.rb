require './lib/cipher_module'

class Decrypt
  include Cipher


  attr_reader :cipher, :key, :date

  def initialize(cipher, key, date)
    @cipher = cipher
    @key = key
    @date = date
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

end
