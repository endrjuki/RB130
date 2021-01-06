items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


=begin
Expected Output:
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!  
=end
gather(items) do |*produce, wheat|
  p produce
  puts wheat
end

=begin
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!  
=end
gather(items) do |apples,*produce, wheat |
  puts apples
  puts produce.join(', ')
  puts wheat
end

=begin
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end
gather(items) do |apples, *produce|
  puts apples
  puts produce.join(', ')
end

=begin
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage} and #{wheat}"
end

