require_relative 'parser'
require_relative 'output'
require_relative 'exceptions'

class WebPageView

  attr_reader :parsed_logs

  def initialize(log_file)
    if log_file.nil? || !File.exist?(log_file)
      raise FileNotFound
    else
      @parsed_logs = Parser.new(log_file).parse
    end
  end

  def views
    Output.new(parsed_logs).show
  end

end
