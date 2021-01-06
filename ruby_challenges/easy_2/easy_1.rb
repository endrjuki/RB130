=begin
consider char set consisting of letters, space and point.
- input text contains one or more words seperated by one or more spaces terminated by a point (last word is terminated by a point instead of space)
- words consist of 1-20(max) letters

OUTPUT
- words seperated by a single space, last terminated by a point
- odd words are in reverse order while even words stay the same

REGEX
- non word boundry \B
- {n, m} quantifier + \w
- /\B\w{1,20}(\B|.$)/ <- test
- will reject a word if it has over 20 letters

- split string into a char of words by using ' ' as a delimiter
- 



=end

class OddWords
  def self.print_words(string)
    output = string.scan(/\b[a-zA-Z]+\b/)
    output.reject! { |word| word.size > 20 }
    puts output.join(' ') + '.'
  end  
end

=begin

word << char if char ~= [a-zA-Z]
  
=end


