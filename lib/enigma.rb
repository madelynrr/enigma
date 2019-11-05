require './lib/key'
require './lib/offset'
require './lib/encryption'
require './lib/decryption'

class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.date)
    encoded = Encryption.new(message, key, date)
    encoded.encrypt_message
  end

  def decrypt(ciphertext, key, date = Offset.new.date)
    decoded = Decryption.new(ciphertext, key, date)
    decoded.decrypt_message
  end

end
