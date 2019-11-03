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
    assert_instance_of Date, @offset.today
    assert_equal Date.today.strftime("%d%m%y"), @offset.date
  end

  def test_it_can_square_date
    @offset.expects(:formatted_date_to_string).at_least_once.returns("031119")

    assert_equal 968392161, @offset.date_squared
  end

  def test_it_can_return_last_four_digits_of_square_as_string_in_array
    @offset.expects(:date_squared).at_least_once.returns(968392161)
    expected = ["2", "1", "6", "1"]

    assert_equal expected, @offset.offsets_as_strings
  end

  def test_it_can_return_offsets_in_hash
    @offset.expects(:offsets_as_strings).at_least_once.returns(["2", "1", "6", "1"])

    expected = {
                "A" => "2",
                "B" => "1",
                "C" => "6",
                "D" => "1"
                }

    assert_equal expected, @offset.turn_to_formatted_hash(@offset.offsets_as_strings)
  end
end
