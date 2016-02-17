class Initials
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name_initials
    name.map { |name| name[0].upcase }.join
  end
end

puts Initials.new(ARGV).name_initials
