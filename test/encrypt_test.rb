require './test/test_helper'
require './lib/enigma'
require './lib/encrypt'

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

  def test_it
end
