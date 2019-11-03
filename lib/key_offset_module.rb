module KeyOffset

  def turn_to_formatted_hash(shift_piece)
    letters_array = ["A", "B", "C", "D"]

    letters_and_numbers = letters_array.zip(shift_piece)

    hash = {}

    letters_and_numbers.each do |pair|
      hash[pair.first] = pair.last
    end
    hash
  end
end
