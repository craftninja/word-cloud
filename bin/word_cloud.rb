require_relative '../lib/word_cloud'
require 'json'

raw = File.read('../data/quotes.json')
data = JSON.parse(raw)
word_cloud = WordCloud.new(data)
word_cloud.count.each_pair do |word, word_data|
  formatted_people = ""
  word_data[:people].each do |person|
    formatted_people += "#{person}, "
  end
  p "The word #{word} was used #{word_data[:count]} times by: #{formatted_people.chomp(', ')}"
end
