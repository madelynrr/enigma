require './lib/key_offset_module'

class Enigma
  include KeyOffset

  def encrypt(message, key = Key.new.number, date = Offset.new.format_date)
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
      Offset.new(date).date
    else
      Offset.new.date
    end
  end

  def key_to_hash(key)
    key = test_key_is_valid(key)
    key_array = key.number_to_array
    turn_to_formatted_hash(key_array)
  end

  def final_shifts(key, date)
  end

  # def final_shifts(key, date)
  #   key.merge(date) { |letter, key_val, date_val| key_val.to_1 += date_val.to_i}
  # end

end
