class Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    result = []
    start_number = 1

    until result.size >= n
      start_number += 1
      result << start_number if prime?(start_number)
    end

    result[n - 1]
  end

  private
  
  def self.prime?(num)
    2.upto(Math.sqrt(num)) { |factor| return false if num % factor == 0 }
    true
  end
end