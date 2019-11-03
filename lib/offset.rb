require './lib/key_offset_module'

class Offset
  include KeyOffset

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
end
