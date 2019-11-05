class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.date)
    encoded = Encrypt.new(message, key, date)
    encoded.encrypt_message
  end

  def decrypt(ciphertext, key, date)
    decoded = Decrypt.new(ciphertext, key, date)
    decoded.decrypt_message
  end

end
