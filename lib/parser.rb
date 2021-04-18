require_relative 'exceptions'

class Parser
  attr_reader :log_file, :parsed_results

  def initialize(log_file)
    @log_file = log_file
    @parsed_results = Hash.new { |hash, key| hash[key] = [] }
  end

  #reads log file and returns parsed result
  def parse
    logs = File.open(log_file).read
    raise InvalidFile if (logs.empty?)
    logs.each_line do |line|
      api_path, ip_address = line.split
      raise InvalidFile if (api_path.nil? || ip_address.nil?)
      parsed_results[api_path] << ip_address
    end
    parsed_results
  end

end

