## Easy Testing

### Boolean Assertion

Write a minitest assertion that will fail if the `value.odd?` is not true.

#### Answer

```ruby
assert_equal(true, value.odd?)
```

#### LS Solution

```ruby
assert value.odd?, `value is not odd`
```

`#assert` tests if it's first argument is a truthy value (not `false` or `nil`, if the first arg is not truthy, the test fails, and the second argument is displayed as a failure message

Most of the minitest assertions lets you to specify a failure message as a final argument. This is frequently omitted, because the messages provided by default are usually sufficient. However, the default msg for `assert` lacks context, so its common to specify the failure message

`assert` isn't directly used in most tests since it's usually more important to ensure an exact value is returned and not just a truthy value., `assert_equal` is a better choice here.

____________________________________________________________________________________________________________

### Equality Assertion

Write a minitest assertion that will fail if `value.downcase` does not return `'xyz'`.

#### Answer

```ruby
assert_equal('xyz', value.downcase)
```

`assert_equal` tests whether its two arguments are equal using `#==`. Failure messages issued by this method assume that the first arg represents the **expected value** , while the second arg represents the actual value to be tested. It's important to maintain this convention for  the failure messages to make sense

____________________________________________________________________________________________________________________________________________________

### Nil Asserions

Write a minitest assertion that will fail if `value` is not `nil`.

#### Answer

```ruby
assert_nil(value)
```

#### LS

It is also possible to use `assert_equal nil, value` here, but `assert_nil` is clearer and provides a better failure message.

____________________________________________________________________________________________________________________

### Empty Object Assertion

Write a minitest assertion that will fail if the Array `list` is not empty.

#### Answer

```ruby
assert_empty list
```

```ruby
assert_equal true, list.empty?
```

`assert_empty` is clearer and provides a better error message.

____

### Included Object Assertion

Write a minitest assertion that will fail if the `'xyz'` is not in the Array `list`.

```ruby
assert_includes(list, 'xyz')
```

it's possible to use

```ruby
assert_equal true, list.include?('xyz')
```

instead, but `#assert_includes` is clearer and issues a better failure message.

___

### Exception Assertions

Write a minitest assertion that will fail unless `employee.hire` raises a `NoExperienceError` exception.

#### Answer

```ruby
assert_raises(NoExperienceError) { employee.hire }
```

`#assert_raises` checks if the given block raises exception of the named type.

___

### Type Assertions

Write a minitest assertion that will fail if `value` is not an instance of the `Numeric` class exactly. `value` may not be an instance of one of `Numeric`'s superclasses.

#### Answer

```ruby
assert_instance_of(Numeric, value)
```

`#assert_instance_of` used `Object#instance_of?` to ensure that it's second argument is an instance of the class named as it's first argument.

___

### Kind Assertions

Write a minitest assertion that will fail if the class of `value` is not `Numeric` or one of `Numeric`'s subclasses (e.g., `Integer`, `Float`, etc).

```ruby
assert_kind_of Numeric, value
```

`assert_kind_of`	 uses `Object#kind_of` to check  if the class of its second argument is an instance of the named class or one of the named class's subclasses

___

### Same Object Assertions

Write a test that will fail if `list` and the return value of `list.process` are different objects.

#### Answer

```ruby
assert_same(list, list.process)
```

uses `equal?` to determine.

___

### Refutations

Write a test that will fail if `'xyz'` is one of the elements in the `Array` `list`:

#### Answer

```ruby
refute_includes list, 'xyz'
```

