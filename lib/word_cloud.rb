require 'pp'

class WordCloud
  def initialize(data)
    @data = data
  end

  def count
    count = {}
    @data.each_pair do |person, phrases|
      phrases.each do |phrase|
        words = phrase.split(/ /)
        words.each do |word|
          word = word.downcase
          count[word] = {:count => 0, :people => []}
        end
      end
    end
    @data.each_pair do |person, phrases|
      phrases.each do |phrase|
        words = phrase.split(/ /)
        words.each do |word|
          word = word.downcase
          count[word][:count] += 1
          count[word][:people] << person
          count[word][:people].uniq!
        end
      end
    end
    count
  end
end
