# Assignment: Build a 'select' method

Write a `select` method that mirrors the behavior of `Array#select`. Note that the `Array#select` method takes a block, then yields each element to the block. If the  block evaluates to true, the current element will be included in the  returned array. If the block evaluates to false, the current element  will not be included in the returned array.

examples of `Array#select`:

```ruby
array = [1, 2, 3, 4, 5]

array.select { |num| num.odd? }       # => [1, 3, 5]
array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```

Therefore, your assignment is to write a `select` method with the above behavior, and you should be able to call it like this:

```ruby
array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```

## Answer

```ruby
def select(array)
  new_arr = []
  counter = 0
  while counter < array.size    
    new_arr << array[counter] if yield(array[counter])
    counter += 1
  end
  
  new_arr
end
```

