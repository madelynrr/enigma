require './test/test_helper'
require './lib/key'
require './lib/offset'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def setup
    @decrypt = Decrypt.new("keder ohulw!!", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decrypt, @decrypt
  end

  def test_it_has_attributes
    assert_equal "keder ohulw!!", @decrypt.cipher
    assert_equal "02715", @decrypt.key
    assert_equal "040895", @decrypt.date
  end

  def test_key_is_valid
    key = "01234"
    assert_equal "01234", @decrypt.test_key_is_valid(key).number

    key = "1234"
    assert_equal "Invalid Key", @decrypt.test_key_is_valid(key)

    key = "class"
    assert_equal "Invalid Key", @decrypt.test_key_is_valid(key)

    key = 12345
    assert_equal "Invalid Key", @decrypt.test_key_is_valid(key)
  end

  def test_date_is_valid
    date = "051119"
    assert_equal "051119", @decrypt.test_date_is_valid(date).date

    date = "51119"
    assert_equal "Invalid Date", @decrypt.test_date_is_valid(date)

    date = "cccccc"
    assert_equal "Invalid Date", @decrypt.test_date_is_valid(date)

    date = 151119
    assert_equal "Invalid Date", @decrypt.test_date_is_valid(date)
  end

  def test_it_can_format_key_into_array
    key = @decrypt.key
    expected = ["02", "27", "71", "15"]

    assert_equal expected, @decrypt.key_to_array(key)
  end

  def test_it_can_format_date_into_array
    date = "040895"
    expected = ["1", "0", "2", "5"]

    assert_equal expected, @decrypt.date_to_array(date)
  end

  def test_it_creates_final_shifts
    key = "02715"
    date = "040895"
    expected = [3, 27, 73, 20]

    assert_equal expected, @decrypt.final_shifts(key, date)
  end

  def test_it_can_decrypt_given_the_key_and_date
    skip
    expected = {
      encryption: "hello world!!",
      key: "02715",
      date: "040895"
      }

    assert_equal expected, @decrypt.decrypt_message("keder ohulw!!", "02715", "040895")
  end

end