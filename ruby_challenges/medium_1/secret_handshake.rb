=begin
-Input
 - Integer (needs to be converted to a binary number) -> string
 - String  (represents a binary number)
   - strings specifying an invalid binary have the value 0.

-Output
 - array

logic:
  - convert it to the appropriate sequence of events for a secret handshake

  1 = wink
  10 = double blink
  100 close your eyes
  1000 jump

  10000 reverse the order of operations

Algorithm
- check if input is a integer
  - if so, convert to a binary num
  - else, validate the input -> valid_binary?
- initialize an array to store the results
- iterate through the digits of the input in reverse order, keep track of idx
  - if digit at:
    - idx 0 == 1, add "wink"
    - idx 1 == 1, add "double blink"
    - idx 2 == 1, add "close your eyes"
    - idx 3 == 1, add "jump"
  to the results array.
  - if digit at idx 4 == 1, reverse the results array
- return the results array
=end

class SecretHandshake
  def initialize(input)
    @binary = process_input(input)    
  end

  def commands
    return [] if @binary == 0
    
    result = []
    @binary.chars.reverse.each_with_index do |digit, idx|
      next unless digit == "1"
      case idx
      when 0 then result << "wink"
      when 1 then result << "double blink"
      when 2 then result << "close your eyes"
      when 3 then result << "jump"
      when 4 then result.reverse!
      end
    end
    result    
  end

  private

  def process_input(input)
    if input.instance_of?(Integer)
      input.to_s(2)
    elsif input.instance_of?(String)
      valid_binary?(input) ? input : 0
    else
      raise ArgumentError, "#{input} is wrong type of input"
    end
  end

  def valid_binary?(string)
    string !~ /[^01]/
  end
end




