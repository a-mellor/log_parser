class LogParser
  class NoDataError < StandardError; end

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def execute
    raise NoDataError, 'The file provided is empty' if File.empty?(file)

    data = Hash.new { |h, k| h[k] = [] }

    f = File.open(file, 'r')

    f.each_line do |line|
      page, ip_address = line.split(' ')
      data[page].push ip_address
    end

    data
  end
end
