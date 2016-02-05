require 'csv'
require 'open-uri'
require 'pry'
# require_relative '2013_college_scorecards'
class CollegeScorecard
  def initialize
    file = CSV.open("./2013_college_scorecards.csv", headers: true, header_converters: :symbol)
    @data = file.to_a.map do |row|
      row.to_h
    end
    binding.pry

  end

  def by_state(state)
    institute = @data.select do |college|
      college[:stabbr] == state
    end
    institute.map do |college|
      college[:instnm]
    end
  end

  def top_average_faculty_salary(number)
    institute = @data.sort_by do |college|
      college[:avgfacsal].to_i
    end
    institute.last(number.to_i).map do |college|
      college[:instnm]
    end.reverse
  end
end

method = ARGV[0]
search_params = ARGV[1]

c_score_card ||= CollegeScorecard.new
if method == "by_state"
  puts c_score_card.by_state(search_params)
else
  puts c_score_card.top_average_faculty_salary(search_params)
end
