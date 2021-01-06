class Triangle
  attr_reader :rows

  def initialize(n)    
    @rows = generate_triangle(n)
  end

  private

  def generate_triangle(n)
    return @rows if n <= 0
    rows = []
    rows << [1]

    2.upto(n) do |row_nr|
      row = []
      row << 1
      rows.last.each_cons(2) { |elements| row << elements.sum }
      row << 1
      rows << row
    end
    rows
  end
end