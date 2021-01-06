class Sieve
  def initialize(n)
    @limit = n
    @sieve = (2..@limit).each_with_object(nil).to_h
  end

  def primes
    2.upto(Math.sqrt(@limit)) do |num|
      number = num

      while number < @limit
        number += num
        next unless @sieve[number].nil?        
        @sieve[number] = true
      end
    end
    
    @sieve.select { |_, v| v.nil? }.keys
  end
end