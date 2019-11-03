require './test/test_helper'
require './lib/final_shift'

class FinalShiftTest < Minitest::Test

  def setup
    key = "02715"
    date = "040895"
    @final_shift = FinalShift.new(key, date)

  end

  def test_it_exists
    assert_instance_of FinalShift, @final_shift
  end

  def test_it_has_attributes
    assert_equal "02715", @final_shift.key
    assert_equal "040895", @final_shift.date
  end

  def test_it_formats_key
    expected = {
                "A" => "02",
                "B" => "27",
                "C" => "71",
                "D" => "15"
                }

    assert_equal expected, @final_shift.format_key

  end

end
