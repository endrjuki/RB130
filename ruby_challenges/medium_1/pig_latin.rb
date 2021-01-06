=begin
# Bad Attempt, hard coded edge cases.
class PigLatin
  VOWELS = %w(a e i o u)
  PIG_LATIN_SOUND = 'ay' 

  def self.translate(word)
    word.split.map { |word| pigify(word) }.join(' ')
  end

  private

  def self.starts_with_vowel?(word)
    VOWELS.include?(word[0])
  end

  def self.pigify(word)
    if starts_with_vowel?(word)
      word + PIG_LATIN_SOUND
    else
      mv_conson_to_end(word)
    end
  end
  
  def self.two_consonants?(word)
    word[0, 2] !~ /[aeiou]/
  end  

  def self.mv_first_n_letters(word, n)
    word[n..-1] + word[0, n] + PIG_LATIN_SOUND
  end

  def self.mv_conson_to_end(word)
    char_count_to_mv = count_consec_conson_plus_u(word)
    mv_first_n_letters(word, char_count_to_mv)
  end

  def self.count_consec_conson_plus_u(word)      
      return 1 if word.size <= 3
      return 1 if word[0, 2] == 'xe'
      return 0 if word[0] == 'x'
      return 0 if word[0, 2] == 'yt'      

      count = 0
      word.chars.each do |char|
        count += 1 if char =~ /[^aeio]/
        break if count == 3 || char =~ /[aeioyu]/ 
      end
      count
  end
end
=end

class PigLatin  
  PIG_LATIN_SOUND = 'ay' 

  def self.translate(word)
    word.split.map { |word| pigify(word) }.join(' ')
  end

  private

  def self.starts_with_vowel?(word)
    word.match(/\A([ae]+[a-z]+|yt|xr)/)
  end

  def self.pigify(word)
    if starts_with_vowel?(word)
      word + PIG_LATIN_SOUND
    else
      mv_conson_to_end(word)
    end
  end  

  def self.mv_first_n_letters(word, n)
    word[n..-1] + word[0, n] + PIG_LATIN_SOUND
  end

  def self.mv_conson_to_end(word)
    char_count_to_mv = count_chars_to_mv(word)
    mv_first_n_letters(word, char_count_to_mv)
  end

  def self.count_chars_to_mv(word)      
    word.match(/\A([^aeiou]qu|qu|[^aeiou]{1,3}|[^aeiou]+u*)/).to_s.size
  end
end