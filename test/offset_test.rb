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
    assert_instance_of Date, @offset.date
    # assert_equal "021119", @offset.date
  end

  def test_it_is_string_in_correct_format
    @offset.expects(:date).at_least_once.returns("")
    assert_equal "021119", @offset.date_to_string
  end
end
