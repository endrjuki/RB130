## Easy 2

### From-To-Step Sequence Generator

The `Range#step` method lets you iterate over a range of  values where each value in the iteration is the previous value plus a  "step" value. It returns the original range.

Write a method that does the same thing as Range#step, but does not  operate on a range. Instead, your method should take 3 arguments: the  starting value, the ending value, and the step value to be applied to  each iteration.  Your method should also take a block to which it will  yield (or call) successive iteration values.

```ruby
step(1, 10, 3) { |value| puts "value = #{value}" }
```

```ruby
value = 1
value = 4
value = 7
value = 10
```

What do you think would be a good return value for this method, and why?

#### Answer

```ruby
def step(start_val, end_val, step_val)
  current_val = start_val
  
  while current_val <= end_val
    yield(current_val)
    current_val += step_val
  end
  
  current_val
end
```



__________________________________________________________________________________________________________

### Zipper

The `Array#zip` method takes two arrays, and combines them  into a single array in which each element is a two-element array where  the first element is a value from one array, and the second element is a value from the second array, in order.  For example:

```ruby
[1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
```

Write your own version of `zip` that does the same type of  operation. It should take two Arrays as arguments, and return a new  Array (the original Arrays should not be changed).  Do not use the  built-in `Array#zip` method.  You may assume that both input arrays have the same number of elements.

Example:

```ruby
zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
```

#### Answer

```ruby
def zip(arr1, arr2)
  result = []
  arr1.each_with_index { |item, idx| result << [item, arr2[idx]] }
  result  
end
```

```ruby
def zip(arr1, arr2)
  result = []
  idx = 0
  
  while idx < arr1.length
    result << [arr1[idx], arr2[idx]]
    idx += 1
  end
  
  result
end
```

#### LS Solution

```ruby
def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(item, idx), result|
    result << [item, arr2[idx]]
  end
end
```

### Map

Write a method called `map` that behaves similarly for  Arrays. It should take an Array as an argument, and a block. It should  return a new Array that contains the return values produced by the block for each element of the original Array.

If the Array is empty, `map` should return an empty Array, regardless of how the block is defined.

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

#### Answer

```ruby
def map(arr)
  arr.each_with_object([]) { |item, result| result << yield(item) }
end
```

_____________________________________________________________________

### Count

Write a method called `count` that behaves similarly for  an arbitrarily long list of arguments. It should take 0 or more  arguments and a block, and then return the total number of arguments for which the block returns true.

If the argument list is empty, `count` should return 0.

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3
```

#### Answer

```ruby
def count(*args)
  count = 0
  [*args].each { |item| count += 1 if yield(item) }
  count
end
```

___________________________________________________________________________

### drop_while

The `Enumerable#drop_while` method begins by iterating  over the members of a collection, passing each element to the associated block until it finds an element for which the block returns `false` or `nil`. It then converts the remaining elements of the collection (including  the element that resulted in a falsey return) to an Array, and returns  the result.

Write a method called `drop_while` that behaves similarly  for Arrays. It should take an Array as an argument, and a block. It  should return all the elements of the Array, except those elements at  the beginning of the Array that produce a truthy value when passed to  the block.

If the Array is empty, or if the block returns a truthy value for every element, `drop_while` should return an empty Array.

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []
```

#### Answer

```ruby
def drop_while(arr)
  return [] if arr.empty?
  
  working_arr = arr.clone
  arr.each { |item| yield(item) ? working_arr.shift : (return working_arr) }
  working_arr  
end
```

#### LS Solution

```ruby
def drop_while(arr)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  
  array[index..-1]
end
```

________________________________________________________________________________________

### each_with_index

The `Enumerable#each_with_index` method iterates over the  members of a collection, passing each element and its index to the  associated block. The value returned by the block is not used. `each_with_index` returns a reference to the original collection.

Write a method called `each_with_index` that behaves  similarly for Arrays. It should take an Array as an argument, and a  block. It should yield each element and an index number to the block. `each_with_index` should return a reference to the original Array.

Your method may use `#each`, `#each_with_object`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
```

```text
0 -> 1
1 -> 3
2 -> 36
true
```

```ruby
def each_with_index(collection)
  index = 0
  collection.each do |item|
    yield(item, index)
    index += 1
  end
end
```

____________________________________________________________________

### each_with_object

The `Enumerable#each_with_object` method iterates over the members of a collection, passing each element  and an arbitrary object (usually a collection) to the associated block.  The value returned by the block is not used. The object that is passed  to the block is defined as an argument to `each_with_object`; with each iteration, this object may be updated by the block. When  iteration is complete, the final value of the object is returned.

Write a method called `each_with_object` that behaves  similarly for Arrays. It should take an Array and an object of some sort as an argument, and a block. It should yield each element and the  object to the block. `each_with_object` should return the final value of the object.

If the Array is empty, `each_with_object` should return the original object passed as its second argument.

Your method may use `#each`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
result == {}
```

#### Answer

```ruby
def each_with_object(collection, object)
  collection.each { |item| yield(item, object) }
  object
end
```

____________________________________________________________________________________________________________________________________________________________

### max_by

The `Enumerable#max_by` method iterates over the members of a collection, passing each element to the  associated block. It then returns the element for which the block  returned the largest value.

Write a method called `max_by` that behaves similarly for `Array`s. It should take an `Array` and a block, and return the element that contains the largest value.

If the `Array` is empty, `max_by` should return `nil`.

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the `Array` passed in as an argument, but must not use any other methods that iterate through an `Array` or any other collection.

```ruby
max_by([1, 5, 3]) { |value| value + 2 } == 5
max_by([1, 5, 3]) { |value| 9 - value } == 1
max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
max_by([-7]) { |value| value * 3 } == -7
max_by([]) { |value| value + 5 } == nil
```

#### Answer

```ruby
def max_by(arr)
  block_rtn_val = nil
  number = nil
  
  arr.each do |item|
    if block_rtn_val.nil?      
      number = item
      block_rtn_val = yield(item)
    else      
      current_block_rtn_val = yield(item)
      if current_block_rtn_val > block_rtn_val
      	number = item
        current_block_rtn_val = block_rtn_val
      end
    end
  end
  number
end
```

_______________________________________________________________________________________________________________

### each_cons pt1

The `Enumerable#each_cons` method iterates over the members of a collection taking each sequence of `n` consecutive elements at a time and passing them to the associated block for processing. It then returns a value of `nil`.

Write a method called `each_cons` that behaves similarly  for Arrays, taking the elements 2 at a time. The method should take an  Array as an argument, and a block. It should yield each consecutive pair of elements to the block, and return `nil`.

Your method may use `#each`, `#each_with_object`, `#each_with_index`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
result == nil
```

#### Answer

```ruby
def each_cons(array)
  array.each_with_index do |_, idx| 
    return nil if idx >= array.size - 1   
    first, last = array[idx], array[idx + 1]
    yield(first, last)
  end
  nil
end
```

___________________________________________________________________________________________________________________________

### each_cons pt2

In the previous exercise, we wrote a method that emulates `Enumerable#each_cons`, but limited our method to handling 2 elements at a time. `Enumerable#each_cons` can actually handle any number of elements at a time: 1, 2, 3, or more.

Update your `each_cons` method so it takes an argument that specifies how many elements should be processed at a time.

Your method may use `#each`, `#each_index`, `#each_with_object`, `#inject`, `loop`, `for`, `while`, or `until` to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other  collection.

```ruby
hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
hash == {}
```

#### Answer

```ruby
def each_cons(col, n)
  col.each_with_index do |item, idx|
    break if idx - 1 + n >= col.size
    cons = col[idx, n]
    yield(*cons)
  end
  nil
end
```

#### LS Solution

```ruby
def each_cons(arr, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end
```

