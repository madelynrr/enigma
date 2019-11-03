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
  end

  def test_it_is_string_in_correct_format
    assert_equal Date.today.strftime("%d%m%y"), @offset.formatted_date_to_string
  end
end
