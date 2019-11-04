require './test/test_helper'
require './lib/key'
require './lib/encrypt'
require './lib/enigma'

class EncryptTest < Minitest::Test

  def setup
    message = "hello world"
    key = "02715"
    date = "040895"
    @encrypt = Encrypt.new(message, key, date)
  end

  def test_it_exists
    assert_instance_of Encrypt, @encrypt
  end

  def test_it_has_attributes
    assert_equal "hello world", @encrypt.message
    assert_equal "02715", @encrypt.key
    assert_equal "040895", @encrypt.date
  end

  def test_test
    assert_equal true, @encrypt.test
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

  def test_it_can_format_key_into_hash
    skip
    @enigma.encrypt("hello world", "02715", "040895")
    key = "02715"
    expected = {
                "A" => "02",
                "B" => "27",
                "C" => "71",
                "D" => "15"
                }

    assert_equal expected, @encrypt.key_to_hash(key)
  end

end
