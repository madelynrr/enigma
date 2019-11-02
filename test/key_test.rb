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
    assert_equal Integer, @key.number.class
  end

  def test_number_is_five_characters_and_string
    assert_equal String, @key.number_to_key_characteristics.class
    assert_equal 5, @key.number_to_key_characteristics.chars.length
  end

  def test_it_splits_number_into_four_elements
    skip
    @key.expects(:number).returns("01234")
    expected = ["01", "12", "23", "34"]

    assert_equal expected, @key.number_to_four_element_string
  end

end
