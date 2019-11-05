module Cipher

  def key_to_array(key)
    key = test_key_is_valid(key)
    key.number_to_array
  end

  def date_to_array(date)
    date_string = test_date_is_valid(date)
    date_squared = date_string.date_squared(date_string.date)
    all_ints = date_squared.to_s.chars
    all_ints[-4..-1]
  end

  def final_shifts(key, date)
    keys = key_to_array(key)
    offsets = date_to_array(date)

    final_shift = keys.zip(offsets)
    final_shift.flat_map do |shift|
      shift.first.to_i + shift.last.to_i
    end
  end
  
end
