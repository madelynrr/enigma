class Offset

  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def date_squared(date)
    date.to_i ** 2
  end

  def offsets_as_strings(date_square)
    all_ints = date_square.to_s.chars

    all_ints[-4..-1]
  end

end
