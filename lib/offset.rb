require './lib/key_offset_module'

class Offset
  include KeyOffset

  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def date_squared(date)
    date.to_i ** 2
  end

  # def offsets_as_strings(square)
  #   all_ints = square.to_s.chars
  #
  #   all_ints[-4..-1]
  # end

end
