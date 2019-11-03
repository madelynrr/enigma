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

# # OFFSET
# def offsets_in_hash
#   letters_array = ["A", "B", "C", "D"]
#
#   letters_and_offsets = letters_array.zip(offsets_as_strings)
#
#   hash = {}
#   letters_and_offsets.each do |pair|
#     hash[pair.first] = pair.last
#   end
#   hash
# end
#
# # KEY
# def hash_of_keys
#   letters_array = ["A", "B", "C", "D"]
#   arrays = letters_array.zip(number_to_array)
#   hash = {}
#   arrays.each do |array|
#     hash[array.first] = array.last
#   end
#   hash
# end
