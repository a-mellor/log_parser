require './lib/data_analyser'

raise 'Please provide one log file' unless ARGV.length == 1

data_analyser = DataAnalyser.new(ARGV[0])

puts "Most page views"
data_analyser.most_page_views.each do |page, ip_address|
  puts "#{page} #{ip_address.count} views"
end

puts "Unique page views"
data_analyser.unique_page_views.each do |page, views|
  puts "#{page} #{views} unique views"
end

