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

  def test_it_splits_number_into_four_elements
    @key.expects(:number).at_least_once.returns("01234")

    expected = ["01", "12", "23", "34"]

    assert_equal expected, @key.number_to_array
  end

  def test_it_returns_array_of_keys
    @key.expects(:number).at_least_once.returns("01234")

    expected = {
                "A" => "01",
                "B" => "12",
                "C" => "23",
                "D" => "34"
                }

    assert_equal expected, @key.turn_to_formatted_hash(@key.number_to_array)
  end

end
