class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.date)
    encoded = Encrypt.new(message, key, date)
    encoded.encrypt_message
  end

end
