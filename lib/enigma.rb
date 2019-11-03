class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.format_date)
  end

  def test_key_is_valid(key)
    if key.class == String && key.chars.length == 5 && key.count("0123456789") == 5
      Key.new(key)
    else
      Key.new
    end
  end

  # def final_shifts(key, date)
  #   key.merge(date) { |letter, key_val, date_val| key_val.to_1 += date_val.to_i}
  # end

  # def format_key(key)
  #   final_key = Key.new(key)
  #   final_key
  # end
end
