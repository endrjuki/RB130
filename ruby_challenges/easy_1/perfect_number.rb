class PerfectNumber
  def self.classify(n)
    raise StandardError if n.negative? || !n.instance_of?(Integer)

    sum_of_divisors = procure_divisors(n).sum

    if sum_of_divisors == n
      'perfect'
    elsif sum_of_divisors > n
      'abundant'
    else
      'deficient'
    end
  end
  
  private

  def self.procure_divisors(n)
    divisors = []
    (n - 1).downto(1) { |divisor| divisors << divisor if n % divisor == 0 }
    divisors
  end
end