class Robot
  attr_reader :name

  @@name_history = []

  def initialize
    initialize_name
  end  

  def reset
    initialize_name
  end  

  private

  def random_digit
    rand(1..9)
  end

  def generate_name
    name = [random_letter, random_letter, random_digit, random_digit, random_digit].join
  end

  def random_letter
    rand(65..90).chr
  end

  def initialize_name
    name = generate_name

    loop do
      break unless @@name_history.include?(name)
      name = generate_name
    end

    @@name_history << name
    @name = name
  end
end