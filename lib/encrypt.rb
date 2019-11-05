class Encrypt

  attr_reader :message, :key, :date, :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
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

  def message_to_arrays(message)
    characters = message.downcase.chars
    message_arrays = []
    until characters.length == 0
      message_arrays << characters.slice!(0..3)
    end
    message_arrays
  end

  def shift_message_arrays(mess_arrays, final_shifts)
    mess_arrays.map do |array|
    rotate_array(array, final_shifts)
    end
  end

  def add_indexes(letter, final_shift)
    alphabet.index(letter) + final_shift
  end

  def rotate_array(letters, final_shifts)
    array = []
    letters.to_enum.with_index do |letter, index|
      if alphabet.include?(letter)
        array << @alphabet.rotate(add_indexes(letter, final_shifts[index])).first
      elsif
        array << letter
      end
    end
    array
  end

  def shifted_to_string(shifted_arrays)
    final_array = shifted_arrays.flatten
    final_array.join
  end

  def encrypt_message
    x = final_shifts(@key, @date)
    shifted_to_string(shift_message_arrays(message_to_arrays(@message), x))
  end


end
