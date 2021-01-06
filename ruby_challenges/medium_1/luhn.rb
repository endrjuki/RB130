class Luhn
  def initialize(num)
    @num = num
  end

  def addends
    self.class.addends(@num)    
  end

  def self.addends(num)
    num.digits.each_with_index.map do |digit, idx|
      if idx.odd?
        digit = digit * 2
        digit >= 10 ? digit - 9 : digit
      else
        digit
      end
    end
    .reverse
  end

  def checksum
    self.class.checksum(@num)
  end

  def self.checksum(num)
    addends(num).sum
  end

  def valid?
    self.class.valid?(@num)
  end  

  def self.valid?(num)
    checksum(num) % 10 == 0
  end

  def self.create(num)
    num = num.digits.reverse.append(0).join.to_i

    if valid?(num)
      num
    else
      missing_digit = 10 - (checksum(num) % 10)
      digits = num.digits
      digits[0] = missing_digit
      digits.reverse.join.to_i
    end
  end
end