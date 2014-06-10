require_relative '../lib/word_cloud'
require 'json'

describe "WordCloud" do
  it 'allows user to get a list of words with counts and person saying words' do
    json_data = '{"person1": ["cat", "dog", "pony"], "person2": ["CAT cat", "dog", "bunny cat"]}'
    data = JSON.parse(json_data)
    word_cloud = WordCloud.new(data)
    actual = word_cloud.count
    expected = {'cat' =>{:count => 4, :people => %w{person1 person2}},
                'dog' =>{:count => 2, :people => %w{person1 person2}},
                'pony' =>{:count => 1, :people => ['person1']},
                'bunny' =>{:count => 1, :people => ['person2']},
    }
    expect(actual).to eq(expected)
  end
end
