```ruby
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5
```

1. Method invocation starts at `line 13`, where `times` method is being called with an argument: `5` and a block of code.
2. Execution enters the first line of method implementation on `line 3` , where local variable `counter` is being initialized and `0` is being assigned to it
3. Execution continues to next line, where `while` conditional is evaluated, the first time around, the condition is `true` , therefore execution continues to next line
4. `line 5` yields to a block with object referenced by `counter` passed in as an argument, which is `0` the first time around
5. Execution jumps to the block on `line 13`, where object referenced by `counter` is being assigned to block local variable `num`
6. Execution continues to the next line of the block where the object currently referenced by `num` is being output
7. Reaching the end of the block, execution return back to method implementation on `line 6`, where local variable `counter` is being incremented by `1`
8. Reaching the end of the `while` loop, execution returns to `line 4`, essentially repeating steps 3 to 7 until the `while` conditional is no longer true.
9. Once `while` conditional returns `false`, execution continues to `line 9`, which just references the object referenced by local variable `number`
10. Reaching the end of the method at `line 10`, execution will return the last expression in this method, which is the `number` local variable.