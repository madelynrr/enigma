require './test/test_helper'
require './lib/key'
# require './test/key_test'
require './lib/offset'
require './test/offset_test.rb'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_encrypt_uses_todays_date_if_none_given
    skip
    @enigma.encrypt("hello world", "02715", "040895")

    # assert_equal "040895", date
  end

  def test_it_tests_key_is_valid_or_generates_new_key
    @enigma.encrypt("hello world", "02715", "040895")
    key = "02715"

    assert_equal "02715", @enigma.test_key_is_valid(key).number

    @enigma.encrypt("hello world", "2715", "040895")
    key = "2715"

    assert_equal false, "2715" == @enigma.test_key_is_valid(key).number

    @enigma.encrypt("hello world", "class", "040895")
    key = "class"

    assert_equal false, "class" == @enigma.test_key_is_valid(key).number

    @enigma.encrypt("hello world", 10234, "040895")
    key = 01234

    assert_equal false, 01234 == @enigma.test_key_is_valid(key).number
  end

  def test_it_creates_final_shifts
    skip
    @enigma.encrypt("hello world", "02715", "040895")
    key = "02715"
    date = "040895"

    expected = {
                "A" => 3,
                "B" => 27,
                "C" => 73,
                "D" => 20
                }

    assert_equal expected, @enigma.final_shifts(key, date)
  end

  def test_it_formats_given_key
    # skip
    @enigma.encrypt("hello world", "02715", "040895")
    key = "02715"

    expected = {
                "A" => "02",
                "B" => "27",
                "C" => "71",
                "D" => "15"
                }

    # assert_equal expected, @enigma.format_key(key)
  end
end
