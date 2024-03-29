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
    assert_equal true, @key.number.count("0123456789") == 5

    @key.expects(:number).at_least_once.returns("01234")
    assert_equal "01234", @key.number

    key_2 = Key.new("23456")
    assert_equal "23456", key_2.number
  end

  def test_it_splits_number_into_four_elements
    @key.expects(:number).at_least_once.returns("01234")

    expected = ["01", "12", "23", "34"]

    assert_equal expected, @key.number_to_array
  end

end
