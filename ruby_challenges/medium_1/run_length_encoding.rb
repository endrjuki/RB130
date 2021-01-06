class RunLengthEncoding
  def self.encode(input)    
    result = ''
    outer_idx = 0
    
    until outer_idx == input.size

      char = input[outer_idx]
      count = 1

      loop do
        inner_idx = outer_idx += 1
        break if inner_idx >= input.size

        comparison_char = input[inner_idx]
        char == comparison_char ? count += 1 : break
      end

      result << count.to_s if count > 1
      result << char
    end
    result
  end

  def self.decode(input)    
    result = ''
    digits = []

    input.chars.each_with_index do |char, idx|      
      #require "pry";binding.pry
      if char.match(/[0-9]/)
        digits << char
      else
        digits.empty? ? result << char * 1 : result << (char * digits.join.to_i); digits = []
      end
    end
    result
  end
end

