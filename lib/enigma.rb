class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.format_date)
  end

  def test_key_is_valid(key)
    if key.class == String && key.chars.length == 5 && key.count("0123456789") == 5
      Key.new(key).number
    else
      Key.new.number
    end
  end

  def test_date_is_valid(date)
    if date.class == String && date.chars.length == 6 && date.count("0123456789") == 6
      Offset.new(date).date
    else
      Offset.new.date
    end
  end

  def final_shifts(key, date)
  end

  # def final_shifts(key, date)
  #   key.merge(date) { |letter, key_val, date_val| key_val.to_1 += date_val.to_i}
  # end

  # def format_key(key)
  #   final_key = Key.new(key)
  #   final_key
  # end
end
