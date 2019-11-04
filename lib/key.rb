# require './lib/key_offset_module'

class Key
  # include KeyOffset

  attr_reader :number

  def initialize(number = rand(99999).to_s.rjust(5, '0'))
    @number = number
  end

  def number_to_array
    integers = number.chars
    individual_keys = []
    integers.each_cons(2) {|integer| individual_keys << integer.join}

    individual_keys
  end
end
