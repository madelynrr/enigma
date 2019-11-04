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

  def test_date_is_valid(date)
    if date.class == String && date.chars.length == 6 && date.count("0123456789") == 6
      Offset.new(date)
    else
      Offset.new
    end
  end

  def key_to_hash(key)
    key = test_key_is_valid(key)
    key_array = key.number_to_array
    turn_to_formatted_hash(key_array)
  end

  def date_to_hash(date)
    date_string = test_date_is_valid(date)
    date_squared = date_string.date_squared(date_string.date)
    all_ints = date_squared.to_s.chars
    final_four = all_ints[-4..-1]
    turn_to_formatted_hash(final_four)
  end

end