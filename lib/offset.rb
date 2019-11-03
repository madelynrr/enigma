class Offset

  attr_reader :date

  def initialize
    @date = Date.today
  end

  def formatted_date_to_string
    date.strftime("%d%m%y")
  end

  def date_squared
    formatted_date_to_string.to_i * formatted_date_to_string.to_i
  end

  def offsets_as_strings
    all_ints = date_squared.to_s.chars

    all_ints[-4..-1]
  end

  def offsets_in_hash
    letters_array = ["A", "B", "C", "D"]

    letters_and_offsets = letters_array.zip(offsets_as_strings)

    hash = {}
    letters_and_offsets.each do |pair|
      hash[pair.first] = pair.last
    end
    hash
  end

end
