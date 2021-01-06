require "pry"
class PhoneNumber
  attr_reader :number

  WRONG_NUMBER = '0000000000'

  def initialize(number)
    @number = process(number)
  end

  def area_code
    @number[0,3]
  end

  def to_s
    "(#{area_code}) #{@number[3,3]}-#{@number[6..-1]}"
  end

  private

  def process(number)
    number.gsub!(/[().\-\s]/, '')
    return WRONG_NUMBER unless valid_number?(number)
    
    number = number[1..-1] if number.size == 11
    number
  end

  def valid_number?(number)    

    if has_illegal_chars?(number) ||
       invalid_length?(number) ||
       length_11_first_char_not_one?(number)           
      return false
    end
    true
  end

  def has_illegal_chars?(n)
    n.match(/[^0-9]/)
  end

  def length_11_first_char_not_one?(number)
    number.size == 11 && number[0] != '1'
  end

  def invalid_length?(n)
    n.size > 11 || n.size < 10
  end
end