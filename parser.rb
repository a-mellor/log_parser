require './lib/data_analyser.rb'

raise 'Please provide one log file' unless ARGV.length == 1

DataAnalyser.new(ARGV[0])
