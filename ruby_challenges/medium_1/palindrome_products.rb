class Palindromes
  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate    
    arr = (@min_factor..@max_factor).to_a
    product = arr.product(arr)
    @palindromes = product.select do |f1, f2|
      p = f1 * f2
      palindrome?(p)
    end
  end

  def largest
    max_val = @palindromes.max_by { |a, b| a * b }.inject(:*)    
    factors = @palindromes.select { |a, b| a * b == max_val }
    factors = factors.map { |fact| fact.sort }.uniq    
    Palindrome.new(factors)
  end

  def smallest
    min_val = @palindromes.min_by { |a, b| a * b }.inject(:*)    
    factors = @palindromes.select { |a, b| a * b == min_val }
    factors = factors.map { |fact| fact.sort }.uniq    
    Palindrome.new(factors)
  end

  def palindrome?(n)
    n.to_s.reverse == n.to_s
  end
end

class Palindrome
  attr_reader :value, :factors

  def initialize(factors)
    @factors = factors
    @value = factors.first.inject(:*)     
  end
end