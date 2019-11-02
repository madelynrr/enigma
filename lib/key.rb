class Key

  attr_reader :number

  def initialize
    @number = rand(99999).to_s.rjust(5, '0')
  end

  def number_to_array
    integers = self.number.chars
    individual_keys = []
    integers.each_cons(2) do |integer|
      individual_keys << integer.join
     end
     individual_keys
  end
end
