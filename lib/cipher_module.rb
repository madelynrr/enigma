module Cipher

  def key_to_array(key)
    final_key = key_is_valid(key)
    final_key.number_to_array
  end

  def date_to_array(date)
    date_string = date_is_valid(date)
    date_squared = date_string.date_squared(date_string.date)
    date_ints = date_squared.to_s.chars
    date_ints[-4..-1]
  end

  def final_shifts(key, date)
    keys = key_to_array(key)
    offsets = date_to_array(date)

    shifts = keys.zip(offsets)
    shifts.flat_map do |shift|
      shift.first.to_i + shift.last.to_i
    end
  end

  def message_to_arrays(message)
    characters = message.downcase.chars
    message_arrays = []
    until characters.length == 0
      message_arrays << characters.slice!(0..3)
    end
    message_arrays
  end

  def rotate_message_arrays(mess_arrays, final_shifts)
    rotated_arrays = mess_arrays.map do |array|
    rotate_array(array, final_shifts)
    end
    rotated_arrays.flatten.join
  end
end
