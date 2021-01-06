class Phrase
  def initialize(phrase)
    @phrase = process_phrase(phrase)
  end

  def word_count
    count = Hash.new(0)
    @phrase.each { |word| count[word] += 1 }
    count
  end

  private

  def process_phrase(phrase)
    phrase.gsub(/[^a-z0-9']/i, ' ').split(' ').map do |word|
      word = word.downcase
      word.match(/\A'\w+'\z/) ? word[1..-2] : word
    end
  end
end