class Trinary
  def initialize(num)
    @trinary = num
  end

  def to_decimal
    return 0 if invalid_trinary
    
    base = 3
    power = 0
    sum = 0

    @trinary.chars.reverse.each do |digit|
      sum += digit.to_i * base ** power
      power += 1
    end
    sum
  end

  def invalid_trinary
    @trinary.match?(/[a-z]/i)
  end
end