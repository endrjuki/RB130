# group 1
my_proc = proc { |thing| puts "This is a #{thing}" }
puts my_proc # <Proc:0x0000556a4a863d00@(irb):1>
puts my_proc.class # Proc
my_proc.call # outputs 'This is a' to console and returns `nil`
my_proc.call('cat') # outputs 'This is a cat' and returns `nil`
=begin
It appears that arguments are optional when invoking Proc objects.
If we don't pass in an argument, code in the block is still executed

1. a new Proc object can be created with a call to `proc` as well as `Proc.new`
2. a Proc is an instance of `Proc`
3. a Proc object does not require that the correct number of arguments are passed to it. If nothing is passed,
then `nil` is assigned to the block variable
=end

# group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda        # <Proc:0x0000556a4a7e5388@(irb):8 (lambda)>
puts my_second_lambda # <Proc:0x0000556a4a861320@(irb):13 (lambda)>
puts my_lambda.class # Proc
my_lambda.call('dog') # outputs 'This is a dog' returns `nil`
my_lambda.call        # ArgumentError
my_second_lambda.call # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } # NameError (uninitialized constant Lambda)
=begin
It appears there are 2 different notations to define a lambda.
It appears that it is not possible to invoke a Lambda without passing in an argument if it has been defined to take one.

1. a new Lambda object can be created with a call to `lambda` or `->` followed by an argument and a block
2. a Lambda is a different variety of Proc, when displayed it contains an extra "(lambda)" that is not present when displaying a regular Proc
3. a Lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an exception is raised
=end

# group 3
def block_method_2(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." } # outputs "This is a ." returns `nil`
block_method_1('seal')                                      # LocalJumpError (no block given (yield))
=begin
We are passing in an argument to `block_method_1`, but we don't yield it to the block, therefore block is executed with `nil` interpolated as ''
`yield` raises exception, because we are not passing in a block at method invocation time

1. a block passed to a method does not enforce the correct number of arguments. If a block variable is defined, and no value is passed in,
then nil is assigned to that block variable
2. if we yield with no block present, an exception is raised
  
=end

# group 4
block_method_2('turtle') { |turtle| puts "This is a #{turtle}. " }                    # outputs "This is a turtle" returns `nil`
block_method_2('turtle') { |turtle, seal| puts "This is a #{turtle} and a #{seal} " } # outputs `This is a turtle and a` and returns `nil`
block_method_2('turtle') { puts "this is a #{animal}." }                              # NameError (undefined local variable or method `animal' for main:Object)
=begin
We are passing in only 1 argument to the block, therefore 2nd block argument `seal` points to `nil`, which is interpolated to `''`
On the last example we are still passing `turtle` to the block, but we aren't defining any block parameters,
therefore `turtle` is never assigned to any block variable, and there is no variable/method named `animal` available in this scope,
therefore we get an exception.

1. If we pass in too few arguments to the block (less than parameters), the remaining block variables are assigned to `nil`
2. Blocks will raise an exception if a variable/method is referenced that doesn't exist in the block's scope.
=end

=begin
Procs are lenient arity rules, we can call a Proc with arbitrary amount of arguments or none at all, and they will be assigned to the
block parameters if we have defined any.

Lambda arity rules appear to be more strict; if we have defined Lamba with a block parameter(s), it has to be called with proper amount of
parameters, otherwise it raises an ArgumentError

Methods have to be invoked with proper amount of parameters, but we can invoke them with blocks that have arbitrary amount of block parameters.

1. Lambdas are a type of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an
object in itself
2. Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in 
=end