class Palindromes
  attr_reader :min_factor, :max_factor, :palindromes

  Palindrome = Struct.new(:factors, :value)

  def initialize(min_factor: 1, max_factor: nil)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    @palindromes = (min_factor..max_factor)
      .to_a
      .repeated_combinations(2)
      .each_with_object({}) do |(n1, n2), result|
        #not finito
      end
  end
end