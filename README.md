# NumericInverse

This gem provides a method `Numeric#inverse` to get a (usual/modular) **multiplicative inverse** of a number readily.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'numeric_inverse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install numeric_inverse

## Usage

The module `NumericInverse` uses "[refinements](https://docs.ruby-lang.org/en/trunk/syntax/refinements_rdoc.html)" to define `#inverse` (alias `#inv`) locally.  You should activate them with `Module#using` or `main.using`.

If you want to define them globally (without refinements), please require `numeric_inverse/ext` instead.

```ruby
require "numeric_inverse"
p Rational(7, 22).inv   #=> NoMethodError

using NumericInverse
p Rational(7, 22).inv   #=> (22/7)
p Integer(16).inv       #=> (1/16)
p Float(16).inv         #=> 0.0625
p Complex(3, 4).inv     #=> ((3/25)-(4/25)*i)

# arithmetic mean and harmonic mean
a = [9, 10, 15, 18]
p a.sum.quo(a.size)           #=> (13/1)
p a.sum(&:inv).inv * a.size   #=> (12/1)
```

In addition, `Integer#inverse` returns its [modular multiplicative inverse](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse) when a modulus is given.

```ruby
require "numeric_inverse"
using NumericInverse

# multiplicative inverse of integers
p 63.inv        #=> (1/63)
p 63.inv * 63   #=> (1/1)

# modular multiplicative inverse
p 63.inv(100)              #=> 27
p 63.inv(100) * 63         #=> 1701
p 63.inv(100) * 63 % 100   #=> 1

p 64.inv(100)   #=> ArgumentError: modulus 100 is not coprime to 64
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hmmnrst/numeric_inverse.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
