factorial = Enumerator.new do |y|
  a = 0

  loop do
    if a == 0 || a == 1
      y << 1
    else
      product = 1
      count = a

      until count == 0
        product *= count
        count -= 1
      end
      y << product
    end
    
    a += 1
  end  
end
puts "First 7:"
7.times { puts factorial.next }
puts "Next 3:"
3.times { puts factorial.next }
factorial.rewind
puts "7 more after `rewind`:"
7.times { puts factorial.next }