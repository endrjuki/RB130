require 'pry'

class WordProblem
  STR_TO_OP = {
    'plus'       => :+,
    'minus'      => :-,
    'multiplied' => :*,
    'divided'    => :/
  }

  def initialize(query)
    @query = query
  end
  
  def answer
    parse_string(@query)
    operand = nil

    until @operations.empty?
      operand = @operands.shift if operand.nil?
      operand = operand.public_send(@operations.shift, @operands.shift)
    end

    operand
  end

  private

  def parse_string(str)
    @operations = []
    @operands = []
    str.split.each do |word|
      @operations << STR_TO_OP[word] if operation?(word)
      @operands << word.to_i if numeric?(word)
    end
    
    raise ArgumentError if @operations.empty? || @operands.empty?
    #binding.pry
  end

  def numeric?(str)
    str.match /[\A\-?\d*\Z]/
  end

  def operation?(str)
    STR_TO_OP.keys.include?(str)
  end
end