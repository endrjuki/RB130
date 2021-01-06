class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.uniq.select { |candidate| is_anagram?(candidate) }
  end

  private
  def is_anagram?(candidate_word)
    word, candidate_word = @word.downcase, candidate_word.downcase
    word != candidate_word &&
    word.chars.sort == candidate_word.chars.sort
  end
end