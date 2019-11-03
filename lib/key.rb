class Key
  
  attr_reader :number

  def initialize
    @number = rand(99999).to_s.rjust(5, '0')
  end
end
