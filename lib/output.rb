require_relative 'visit'
require_relative 'pretty_output'

class Output

  attr_reader :total_visit, :unique_visit

  def initialize(parsed_result)
    @parsed_result = parsed_result
    @total_visit = Visit.new(parsed_result).total_visit
    @unique_visit = Visit.new(parsed_result).unique_visit
  end

  #shows output of the result
  def show
    total_visit_hsh = Hash.new(:total_visit)
    total_visit_hsh[:total_visit] = total_visit
    unique_visit_hsh = Hash.new(:unique_visit)
    unique_visit_hsh[:unique_visit] = unique_visit
    [total_visit_hsh,unique_visit_hsh].map do |visiter|
      PrettyOutput.new(visiter.keys.first, visiter.values.first).formatted_result
    end
  end


end
