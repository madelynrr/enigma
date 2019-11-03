require './lib/key_offset_module'

class Offset
  include KeyOffset

  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def date_squared
    formatted_date_to_string.to_i ** 2
  end

  def offsets_as_strings
    all_ints = date_squared.to_s.chars

    all_ints[-4..-1]
  end

end
