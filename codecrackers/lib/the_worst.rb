require 'pry'
class TheWorst
  CIPHER = ("a".."z").to_a
  CAP_CIPHER = ("A".."Z").to_a

  attr_reader :key_encryptor, :message

  def initialize(message)
    @key_encryptor = message[0]
    @message = message[1..-1]
  end

  def encrypt_word
    key_length = key_encryptor.length
    letters = message.join(" ").chars

    letters.map do |char|
      encrypt(char, rotator[letters.index(char) % key_length])
    end.join(" ")
  end

  def encrypt(letter, rotation)
    if index = CIPHER.index(letter)
      CIPHER[(index + rotation) % 26]
    elsif
      index = CAP_CIPHER.index(letter)
      CAP_CIPHER[(index + rotation) % 26]
    else
      letter
    end
  end

  def rotator
    key_encryptor.downcase.chars.map do |char|
      CIPHER.index(char)
    end
  end
end

a = TheWorst.new(ARGV)
puts a.encrypt_word
