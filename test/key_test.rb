require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal String, @key.number.class
    assert_equal 5, @key.number.chars.length
  end

  def test_it_splits_number_into_four
    skip
  end

end
