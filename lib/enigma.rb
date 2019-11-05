class Enigma

  def encrypt(message, key = Key.new.number, date = Offset.new.date)
    final_shifts(key, date)
  end

end
