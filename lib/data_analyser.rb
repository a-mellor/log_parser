require './lib/log_parser'
require './lib/formatter'

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

  def most_page_views
    Formatter.new(parse).sort_by_most_page_views
  end

  def unique_page_views
    Formatter.new(parse).sort_by_unique_page_views
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
