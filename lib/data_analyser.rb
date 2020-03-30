require 'log_parser'

class DataAnalyser
  ACCEPTED_FILES = ['.log'].freeze

  class InvalidFileError < StandardError; end

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def parse
    valid?

    LogParser.new(file).execute
  end

  def valid?
    file_extension = File.extname(file)
    unless ACCEPTED_FILES.include?(file_extension)
      raise InvalidFileError,
            "#{file_extension} is not vaild, please prodive #{ACCEPTED_FILES.join(',')} file"
    end

    true
  end
end
