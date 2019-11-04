require './lib/key_offset_module'

class Encrypt
  include KeyOffset

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def test_key_is_valid(key)
    if key.class == String && key.chars.length == 5 && key.count("0123456789") == 5
      Key.new(key)
    else
      Key.new
    end
  end

  def key_to_hash(key)
    key = test_key_is_valid(key)
    key_array = key.number_to_array
    turn_to_formatted_hash(key_array)
  end

end
