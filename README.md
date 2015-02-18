# DefStruct

Creates Struct classes with default attribute values


## Usage

The `DefStruct.new` method takes a block, and that block should return
a _new copy_ of the defaults as a hash. It returns a new class, just
like `Struct.new`. In fact, the return class is a subclass of `Struct`.

```ruby
Point = DefStruct.new{{ x: 0, y: 0 }}
Point.superclass #=> Struct
```

The initialiser for the class differs from `Struct` in that it takes
a single hash, instead of multiple arguments. Any attributes that
are missing will take their default values.

```ruby
p = Point.new
p.x #=> 0.0
p.y #=> 0.0

p2 = Point.new(x: 5)
p2.x #=> 5
p2.y #=> 0
```

The `Struct.new` method takes a block that allows you to define
extra methods on the newly created class. This feature is available
in DefStruct, but it works slightly differently.

You can either reopen the class, as you would any Ruby class:

```ruby
class Point
  def to_a
    [x, y]
  end
end
```

or, you can use the `reopen` class method to do it with a single statement:

```ruby
Point = DefStruct.new{{ x: 0.0, y: 0.0 }}.reopen do
  def to_a
    [x, y]
  end
end
```

## Benchmarking

Benchmarks can be run with `bundle exec ruby benchmarks.rb`

```
                                              user     system      total        real
                         Empty iteration  0.020000   0.000000   0.020000 (  0.020438)
              NormalVector instantiation  0.110000   0.000000   0.110000 (  0.119884)
   DefStructVector default instantiation  0.800000   0.000000   0.800000 (  0.799010)
  DefStructVector explicit instantiation  1.090000   0.020000   1.110000 (  1.113324)
         NormalVector attr access/mutate  0.080000   0.000000   0.080000 (  0.078566)
      DefStructVector attr access/mutate  0.080000   0.000000   0.080000 (  0.078589)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'defstruct'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defstruct

## Contributing

1. Fork it ( https://github.com/tomdalling/defstruct/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
