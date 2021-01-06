class SumOfMultiples  
  def initialize(*numbers)
    @multiples = numbers    
  end

  def self.to(limit, multiples = [3, 5])
    multiples_arr = []
    (1...limit).each do |number|
      multiples_arr << number if multiple?(number, multiples)
    end
    multiples_arr.sum
  end

  def to(limit)
    self.class.to(limit, @multiples)
  end

  private  
  def self.multiple?(num, multiples_of)
    multiples_of.any? { |multiple| num % multiple == 0 }
  end
end