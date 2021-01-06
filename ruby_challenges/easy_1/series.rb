class Series
  def initialize(num)
    @digits = num.to_s.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > @digits.length
    result = []
    @digits.each_cons(n) { |sub_arr| result << sub_arr }
    result
  end
end