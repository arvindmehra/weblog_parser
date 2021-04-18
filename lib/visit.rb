class Visit
  attr_reader :visit_hash, :parsed_result

  def initialize(parsed_result)
    @visit_hash = Hash.new
    @parsed_result = parsed_result
  end

  #returns a hash of total visits in descending order
  def total_visit
    parsed_result.each do |result|
      visit_hash[result.first] = result.last.count
    end
    visit_hash.sort_by{|k,v| v}.reverse.to_h
  end

  #returns a hash of unique visits in descending order
  def unique_visit
    parsed_result.each do |result|
      visit_hash[result.first] = result.last.uniq.count
    end
    visit_hash.sort_by{|k,v| v}.reverse.to_h
  end


end
