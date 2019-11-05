class Decrypt

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

end
