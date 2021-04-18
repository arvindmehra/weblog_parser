class PrettyOutput

  attr_reader :visits, :visit_type

  def initialize(visit_type, visits)
    @visits = visits
    @visit_type = visit_type
  end

  #prints formatted result of unique and total visits
  def formatted_result
    printf "%s\n\n", send("text_"+"#{@visit_type}")
    visits.map do |path, view_count|
      printf "%-20s %s %s\n", path, view_count, send("views_"+"#{@visit_type}")
    end
    printf "\n"
  end

  #dynamic methods for total and unique visits specific text outputs
  ["total_visit", "unique_visit"].each do |method|
    define_method "text_#{method}" do
      method.to_s.split("_").map(&:capitalize).join(' ')
    end

    define_method "views_#{method}" do
      method.include?("unique_visit") ? "unique views" : "visits"
    end
  end

end
