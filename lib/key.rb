class Key

  attr_reader :number

  def initialize
    @number = rand(99999).to_s
    require "pry"; binding.pry
  end
end
