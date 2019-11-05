require './test/test_helper'
require './lib/key'
require './lib/offset'
require './lib/encrypt'
require './lib/enigma'

class EncryptTest < Minitest::Test

  def setup
    @encrypt = Encrypt.new("Hello world!!", "02715",  "040895")
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_attributes
    assert_equal "Hello world!!", @encrypt.message
    assert_equal "02715", @encrypt.key
    assert_equal "040895", @encrypt.date
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @encrypt.alphabet
  end

  def test_it_tests_key_is_valid_or_generates_new_key
    key = "02715"
    assert_equal "02715", @encrypt.test_key_is_valid(key).number

    encrypt_2 = Encrypt.new("hello world", "2715", "040895")
    key = "2715"
    assert_equal false, "2715" == encrypt_2.test_key_is_valid(key).number

    encrypt_3 = Encrypt.new("hello world", "class", "040895")
    key = "class"
    assert_equal false, "class" == encrypt_3.test_key_is_valid(key).number

    encrypt_4 = Encrypt.new("hello world", 10234, "040895")
    key = 01234
    assert_equal false, 01234 == encrypt_4.test_key_is_valid(key).number
  end

  def test_it_tests_date_is_valid
    date = "040895"
    assert_equal true, "040895" == @encrypt.test_date_is_valid(date).date

    encrypt_1 = Encrypt.new("hello world", "02715", "40895")
    date = "40895"
    assert_equal false, "40895" == encrypt_1.test_date_is_valid(date).date

    encrypt_2 = Encrypt.new("hello world", "02715", "cccccc")
    date = "cccccc"
    assert_equal false, "cccccc" == encrypt_2.test_date_is_valid(date).date

    encrypt_3 = Encrypt.new("hello world", "02715", 110895)
    date = 110895
    assert_equal false, 110895 == encrypt_3.test_date_is_valid(date).date
  end

  def test_it_can_format_key_into_array
    key = @encrypt.key
    expected = ["02", "27", "71", "15"]

    assert_equal expected, @encrypt.key_to_array(key)
  end

  def test_it_can_format_date_into_array
    date = "040895"
    expected = ["1", "0", "2", "5"]

    assert_equal expected, @encrypt.date_to_array(date)
  end

  def test_it_creates_final_shifts
    key = "02715"
    date = "040895"
    expected = [3, 27, 73, 20]

    assert_equal expected, @encrypt.final_shifts(key, date)
  end

  def test_it_turns_message_into_array_of_arrays
    message = "Hello world!!"
    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"], ["!"]]

    assert_equal expected, @encrypt.message_to_arrays(message)
  end

  def test_it_changes_letters_by_corresponding_shift
    mess_arrays = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"], ["!"]]
    # message = "Hello world!"

    final_shifts = [2, 1, 6, 1]
    expected = "jfrmqabptmj!!"

    assert_equal expected, @encrypt.shift_message_arrays(mess_arrays, final_shifts)
  end

  def test_it_rotates_each_letter_in_four_element_array
    array = ["h", "e", "l", "l"]
    final_shifts = [2, 1, 6, 1]
    expected = ["j", "f", "r", "m"]

    assert_equal expected, @encrypt.rotate_array(array, final_shifts)
  end

  def test_it_can_encrypt_given_message
    expected = {
                encryption: "keder ohulw!!",
                key: "02715",
                date: "040895"
                }

    assert_equal expected, @encrypt.encrypt_message
  end

end
