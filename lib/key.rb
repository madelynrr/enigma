class Key

  attr_reader :number

  def initialize
    @number = rand(99999)
  end

  def number_to_key_characteristics
    number_to_string = @number.to_s
    number_to_string.rjust(5, '0')
  end
end
