class Octal
  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 if invalid_octal
    base = 8
    power = 0
    sum = 0

    @octal_num.chars.reverse.each do |digit|
      sum += digit.to_i * (base ** power)      
      power += 1
    end

    sum
  end

  private

  def invalid_octal
    @octal_num.match?(/[a-z]/) || @octal_num.to_i.digits.max >= 8    
  end
end