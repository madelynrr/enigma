class Key

  attr_reader :number

  def initialize
    @number = rand(99999).to_s.rjust(5, '0')
  end

  def number_to_array
    integers = self.number.chars
    individual_keys = []
    integers.each_cons(2) {|integer| individual_keys << integer.join}

    individual_keys
  end

  def hash_of_keys
    letters_array = ["A", "B", "C", "D"]
    arrays = letters_array.zip(number_to_array)
    hash = {}
    arrays.each do |array|
      hash[array.first] = array.last
    end
    hash
  end
end
