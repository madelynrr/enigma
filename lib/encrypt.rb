require 'date'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")

message_to_encode = handle.read
handle.close

encrypted_message = enigma.encrypt(message_to_encode)

# writer = File.open(ARGV[1], "w")
