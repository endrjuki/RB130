class Integer
  ROMAN = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman
    roman = ''
    digits.each_with_index { |n, power| roman.prepend component_to_roman(n, power) }
    roman
  end
  
  private
  
  def component_to_roman(number, power)    
    component = 10 ** power

    case number
    when 0..3 then ROMAN[component] * number
    when 4    then ROMAN[component] + ROMAN[component * 5]
    when 5    then ROMAN[component * 5]
    when 6..8 then ROMAN[component * 5] + ROMAN[component] *  (number - 5)
    when 9    then ROMAN[component] + ROMAN[component * 10]
    end       
  end
end 
