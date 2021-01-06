## Easy 1

### Enumerable Class Creation

Assume we have a `Tree` class that implements a binary tree.

```ruby
class Tree
  # ...
end
```

A binary tree is just  one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include `Enumerable` module, which means they have access to an `each` method, as well as many other such methods as `map`, `reduce`, `select`, and more

For this exercise, modify the `Tree` class to support the methods of `Enumerable`. You do not need to actually implement any methods -- just show the methods that you must provide.

#### Answer 

```ruby
class Tree
  include Enumerable
  
  def each
    # implementation
  end
end
```

**To provide most functionality of `Enumerable` module, all you need is to include `Enumerable` and  define `each` method that yields a member of the collection, one at a time.**

_______________________________________________________________________________________________

### Optional Blocks

Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the string `"does not compute"`

```ruby
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'
```

#### Answer

```ruby
def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end
```

#### LS Answer

```ruby
def compute
  return 'Does not compute' unless block_given?
  yield
end
```

- `Kernel#block_given?` method can be used to determine if a block has passed in at method invocation time, even if there is no mention of a block in the method  arguments. We use it here to determine when should we return `Does not compute`, and when should we yield to the block and return that value.

#### Further Exploration

Modify the `compute` method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of  calling this new version of `compute`, including a no-block call.

```ruby
def compute(arg)
  return 'Does not compute' unless block_given?
  yield(arg)  
end

compute(1)                                # => "Does not compute"
compute(1) { |arg| arg + 2 }              # => 3
compute(1) { "Still does not compute..."} # => => "Still does not compute..."
```

______________________________________________________________________________

### Find Missing Numbers

Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order)  between the first and last elements of the argument.

```ruby
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []
```

#### Answer

```ruby
def missing(arr)
  return [] if arr.length < 2
  
  current_number = arr[0]
  end_number = arr[-1]
  missing_numbers = []
  
  while current_number != end_number
    current_number += 1
    missing_numbers << current_number unless arr.include?(current_number)
  end
  
  missing_numbers
end
```

#### LS Answer

```ruby
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
end
[-3, -2, 1, 5]
```

The problem boils down to finding the missing integers between each pair of numbers of in the OG array.

`Enumerable#each_cons` is extremely handy when you need to iterate through consecutive, overlapping sequences.

`Enumerable#each_slice` by contrast, iterates through consecutive, non-overlapping sequences

### Divisors

```ruby
def divisors(n)
  result = []  
  1.upto(n) { |div| result << div if n % div == 0 }
  result
end
```

#### LS Solution

```ruby
def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end
```

#### [LOOK INTO IT]Further Exploration

You may have noticed that the final example took a few seconds, maybe even a minute or more, to complete. This shouldn't be a surprise as we  aren't doing anything to optimize the algorithm. It's what is commonly  called a brute force algorithm where you try every possible solution;  these are easy to write, but they don't always produce fast results.  They aren't necessarily bad solutions -- it depends on your needs -- but the speed of brute force algorithms should always be examined.

How fast can you make your solution go? How big of a number can you quickly reduce to its divisors?  Can you make `divisors(999962000357)` return almost instantly?  (The divisors are [1, 999979, 999983,  999962000357].) Hint: half of the divisors gives you the other half.

#### Answer

```ruby
def divisors(n)
  result = []
  1.upto(Math.sqrt(n)) do |div|
    result << div << n / div if n % div == 0    
  end
  result.uniq.sort  
end
```





________________________________________________________________________________________________________________________________________

### Encrypted Pioneers 

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the  field. The names are in an encrypted form, though, using a simple (and  incredibly weak) form of encryption called [Rot13](https://en.wikipedia.org/wiki/ROT13).

```
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
```

#### Answer

```ruby
encrypted_pioneers = <<~HEREDOC
  Nqn Ybirynpr
  Tenpr Ubccre
  Nqryr Tbyqfgvar
  Nyna Ghevat
  Puneyrf Onoontr
  Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
  Wbua Ngnanfbss
  Ybvf Unvog
  Pynhqr Funaaba
  Fgrir Wbof
  Ovyy Tngrf
  Gvz Orearef-Yrr
  Fgrir Jbmavnx
  Xbaenq Mhfr
  Fve Nagbal Ubner
  Zneiva Zvafxl
  Lhxvuveb Zngfhzbgb
  Unllvz Fybavzfxv
  Tregehqr Oynapu
HEREDOC

encrypted_pioneers = encrypted_pioneers.split("\n")

def rot_letter(letter)  
  return letter if letter =~ /[^a-z]/i

  rotation = 13
  alpha_size = 25
  first_letter_ord = 97
  last_letter_ord = first_letter_ord + alpha_size
  
  
  letter_ord = letter.ord
  if letter_ord + rotation <= last_letter_ord
    new_letter = (letter_ord + rotation).chr
  else
    new_letter = (letter_ord + rotation - alpha_size - 1).chr
  end  
end

def rot13(str)
  str.chars.map do |char|
    if char == ' '
      char
    else
      upper_case = char.upcase == char ? true : false
      new_letter = rot_letter(char.downcase)
      upper_case ? new_letter.upcase : new_letter
    end
  end
  .join('')
end

decrypted_pioneers = encrypted_pioneers.map { |pioneer| rot13(pioneer) }
puts decrypted_pioneers
```

#### LS Solution

```ruby
ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypred_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
end
    
ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
```

_____________________________________________________________________________________________________

### Iterators: True or Any?

The `Enumerable#any?` method processes elements in a  collection by passing each element value to a block that is provided in  the method call. If the block returns a value of `true` for any element, then `#any?` returns true. Otherwise, `#any?` returns false.  Note in particular that `#any?` will stop searching the collection the first time the block returns `true`.

Write a method called `any?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for any of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `true`.

If the Array is empty, `any?` should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.

```ruby 
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false
```

#### Answer

```ruby
def any?(arr)
  return false if arr.empty?  
  arr.each { |element| return true if yield(element) } 
  false
end
```

#### LS Solution

```ruby
def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end
```

#### Further Exploration

Our solution uses `Enumerable#each` for the main loop. The advantage of doing this is that `any?` will work with any Enumerable collection, including Arrays, Hashes, Sets, and more. So, even though we only need `any?` to work with Arrays, we get additional functionality for free.

Does your solution work with other collections like Hashes or Sets?

_______________________________________________________________________________________________________________________

### Iterators: True for All?

In the previous exercise, you developed a method called `any?` that is similar to the standard `Enumerable#any?` method for Arrays (our actual solution works with any Enumerable  collection). In this exercise, you will develop its companion, `all?`.

`Enumerable#all?` processes elements in a collection by  passing each element value to a block that is provided in the method  call. If the block returns a value of `true` for every element, then `#all?` returns true. Otherwise, `#all?` returns false.  Note in particular that `#all?` will stop searching the collection the first time the block returns `false`.

Write a method called `all?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for all of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `false`.

If the Array is empty, `all?` should return true, regardless of how the block is defined.

Your method may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.

Examples:

```ruby
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true
```



#### Answer

```ruby
def all?(collection)
  collection.each { |item| return false if !yield(item)}
  true
end
```

#### LS solution

```ruby
def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end
```

_______________________________________________________________________________________________________________________

### Iterators: True for none?

`Enumerable#none?` processes elements in a collection by  passing each element value to a block that is provided in the method  call. If the block returns `true` for any element, then `#none?` returns `false`. Otherwise, `#none?` returns true. Note in particular that `#none?` will stop searching the collection the first time the block returns `true`.

Write a method called `none?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `false` for all of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `true`.

If the Array is empty, `none?` should return `true`, regardless of how the block is defined.

Your method may not use any of the following methods from the `Array` and `Enumerable` classes: `all?`, `any?`, `none?`, `one?`. You may, however, use either of the methods created in the previous two exercises.

```ruby
none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true
```



#### Answer

```ruby
def none?(collection)
  collection.each { |item| return false if yield(item) }
  true  
end
```

#### LS Solution

```ruby
def none?(collection, &block)
  !any?(collection, &block)
end
```

You may think that you can just do this:

```ruby
def none?(collection)
  !any?(collection)
end
```

However this fails:

```text
no block given (yield) (LocalJumpError)
```

The reason for this is that blocks aren't passed down the calling chain by default, so we need to explicitly pass it to `any?` 

_______________________________________________________________________________________

### Iterators: true for one?

`Enumerable#one?` processes elements in a collection by  passing each element value to a block that is provided in the method  call. If the block returns a value of `true` for exactly one element, then `#one?` returns true. Otherwise, `#one?` returns `false`.  Note in particular that `#one?` will stop searching the collection the second time the block returns `true`.

Write a method called `one?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for exactly one of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `true` a second time.

If the Array is empty, `one?` should return `false`, regardless of how the block is defined.

Your method may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.

```ruby
one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false
```

#### Answer

```ruby
def one?(collection)
  true_count = 0
  collection.each do |item|
    true_count += 1 if yield(item)
    return false if true_count > 1
  end
  
  true_count == 1 ? true : false
end
```

#### LS Solution

```ruby
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end
```

_____________________________________________________________________________________________________________________________

### Count Items

Write a method that takes an array as an argument, and a block that  returns true or false depending on the value of the array element passed to it. The method should return a count of the number of times the  block returns `true`.

You may not use `Array#count` or `Enumerable#count` in your solution.

```ruby
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
```

#### Answer

```ruby
def count(collection)
  count = 0
  collection.each { |item| count += 1 if yield(item) }
  count
end
```

#### Further Exploration

Write a version of the `count` method that meets the conditions of this exercise, but also does not use `each`, `loop`, `while`, or `until`.

```ruby
def count(arr)
  count = 0
  
  for item in arr
    count += 1 if yield(item)
  end
  
  count
end
```

