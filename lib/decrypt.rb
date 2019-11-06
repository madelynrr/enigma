require 'date'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")

message_to_decode = handle.read
handle.close

decoded_message_hash = enigma.decrypt(message_to_decode, ARGV[2], ARGV[3])
decoded_message = decoded_message_hash[:decryption]

writer = File.open(ARGV[1], "w")
writer.write(decoded_message)
writer.close

puts "Created 'decrypted.txt' with the key #{decoded_message_hash[:key]} and date #{decoded_message_hash[:date]}."
