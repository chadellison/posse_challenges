class Caesar
  attr_reader :message, :rotator, :cypher

  def initialize(rotator, message)
    @rotator = rotator.to_i
    @message = message.join(" ").chars
    @cypher = ("a".."z").to_a + [" ", "!", ".", ",", "?"]
  end

  def encrypt
    encrypt_message = rotate_index.map do |index|
      cypher[index % 31]
    end

    message.each do |char|
      encrypt_message[message.index(char)].upcase! if char == char.upcase && char != " "
    end
    encrypt_message.join
  end

  def index_message
    message.map do |char|
      letter_to_index = char.downcase
      cypher.index(letter_to_index)
    end
  end

  def rotate_index
    index_message.map do |index|
      index + rotator
    end
  end
end

a = Caesar.new(ARGV[0], ARGV[1..-1])
puts a.encrypt
