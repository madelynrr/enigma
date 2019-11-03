require './lib/key_offset_module'

class Offset
  include KeyOffset

  attr_reader :date

  def initialize(date = Date.today)
    @date = date
  end

  def format_date
    date.strftime("%d%m%y")
  end

  def date_squared
    formatted_date_to_string.to_i ** 2
  end

  def offsets_as_strings
    all_ints = date_squared.to_s.chars

    all_ints[-4..-1]
  end

end
