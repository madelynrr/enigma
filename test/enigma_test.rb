require './test/test_helper'
require './lib/key'
require './test/key_test'
require './lib/offset'
require './test/offset_test.rb'
require './lib/encryption'
require './lib/decryption'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_encrypt_without_given_date
    enigma_1 = Enigma.new

    expected = {
      encryption: "jfrmqabptmj!!",
      key: "00000",
      date: "041119"
      }

    assert_equal Date.today.strftime("%d%m%y"), enigma_1.encrypt("hello world!!", "00000")[:date]
  end

  def test_it_can_encrypt_without_given_key_or_date
    enigma_1 = Enigma.new

    assert_equal 13, enigma_1.encrypt("hello world!!")[:encryption].length
  end

  def test_it_can_decrypt
    enigma_2 = Enigma.new
    expected = {
      decryption: "hello world!!",
      key: "02715",
      date: "040895"
      }

    assert_equal expected, enigma_2.decrypt("keder ohulw!!", "02715", "040895")
  end


end
