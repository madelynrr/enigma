require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_attributes
   assert_equal String, @offset.date.class
   assert_equal 6, @offset.date.chars.length
   assert_equal true, @offset.date.count("0123456789") == 6
  end

  def test_it_can_square_date
    date = "031119"

    assert_equal 968392161, @offset.date_squared(date)
  end

  def test_it_can_return_last_four_digits_of_square_as_string_in_array
    square = 968392161
    expected = ["2", "1", "6", "1"]

    assert_equal expected, @offset.offsets_as_strings(square)
  end

end
