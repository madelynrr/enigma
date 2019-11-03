class Offset

  attr_reader :date

  def initialize
    @date = Date.today
  end

  def formatted_date_to_string
    date.strftime("%d%m%y")
  end

end
