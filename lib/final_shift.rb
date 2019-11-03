require './lib/key_offset_module'

class FinalShift
  include KeyOffset

  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def format_key(key)
    integers = key.chars
    individual_keys = []
    integers.each_cons(2) { |integer| individual_keys << integer.join }

    turn_to_formatted_hash(individual_keys)
  end

  # def number_to_array
  #   integers = number.chars
  #   individual_keys = []
  #   integers.each_cons(2) {|integer| individual_keys << integer.join}
  #
  #   individual_keys
  # end


end
