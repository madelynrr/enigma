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

  def test_it_can_decrypt_given_the_key_and_date
    skip
    expected = {
      encryption: "hello world!!",
      key: "02715",
      date: "040895"
      }

    assert_equal expected, @encrypt.decrypt_message("keder ohulw!!", "02715", "040895")
  end

end
