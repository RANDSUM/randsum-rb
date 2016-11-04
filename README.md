# Randsum

[![Build Status](https://travis-ci.org/RANDSUM/randsum.svg?branch=master)](https://travis-ci.org/RANDSUM/randsum)[![Code Climate](https://codeclimate.com/github/RANDSUM/randsum/badges/gpa.svg)](https://codeclimate.com/github/RANDSUM/randsum) [![Test Coverage](https://codeclimate.com/github/RANDSUM/randsum/badges/coverage.svg)](https://codeclimate.com/github/RANDSUM/randsum/coverage) [![Issue Count](https://codeclimate.com/github/RANDSUM/randsum/badges/issue_count.svg)](https://codeclimate.com/github/RANDSUM/randsum)
all hail the rectangles
## Finally, a way to roll specific quantities of particular sides of dice.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'randsum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install randsum

## How to Get Rolling

```
$ gem install randsum
$ irb
> require 'randsum'
#=> true
```

### The `Die` Class

`Randsum` lets you make `Die`, which sounds like an existential baby stringing together its first downer of a sentence.

A `Die` represents something more commonly referred to in the plural - Dice. Each `Die` takes an argument in its initializer, representing the number of sides of the die you want to make.

```
> d6 = Randsum::Die.new(6)
```

Once you've created this new random number object, you can use `.roll` to generate a random number from 1 to the size of the die.

```
> d6.roll
#=> You rolled 1 d6, and got a 5. (Rolls: [5])
```

...aw, go ahead. Roll it a few more times. I won't blame you.

```
> d6.roll
#=> You rolled 1 d6, and got a 6. (Rolls: [6])

> d6.roll
#=> You rolled 1 d6, and got a 3. (Rolls: [3])
```

That's pretty neat, right?

`Randsum` comes pre-packaged with several shortcuts for popular Die sizes:

```
#D20
> Randsum::D20.roll
#=> You rolled 1 d20, and got a 20. (Rolls: [20])

#D12
> Randsum::D12.roll
#=> You rolled 1 d12, and got a 2. (Rolls: [2])

#D2-6, D8, and D10!
```

### Rolling Multiple Dice

`Die#roll` also takes an optional argument that represents how many bones you want to roll. Check it:

```
> Randsum::D6.roll(2)
#=> You rolled 2 d6, and got a 2. (Rolls: [1, 1])
```

Snakeyes. Rough.


### Making use of the rolls: the `RollReport`

`Die#roll` returns a `RollReport` object, which can teach you a lot about your rolls (but not, tragically, how to roll better.)

```
> report = Randsum::D20.roll 5
#=> You rolled 5 d20, and got a 61. (Rolls: [20, 16, 9, 14, 1])
```

The `#total` method represents the sum total of the dice that were rolled:

```
> report.total
#=> 61
```

The `#rolls` array, which reports the individual results of any dice rolled:

```
> report.rolls
#=> [20, 17, 9, 14,1]
```

`#quantity` tells you how many dice were rolled this time:

```
> report.quantity
#=> 5
```

`#sides` reports the number of sides on the dice rolled in this result:

```
> report.sides
#=> 20
```

And if you don't like that roll (hey we get it) you can use `#die` to get another of the same die to roll again!

```
> report.die.roll
#=> You rolled 1 D20, and got 17. (Rolls: [17])
```

#### Manipulating `RollReport`s

Roll results can be further manipulated after their original creation. To facilitate popular use-cases for Dice rolling, `RollReport`s also include public `#drop_lowest` and `#drop_highest`, and `#drop` methods.

`#drop_lowest` returns a new `RollReport` without the lowest numerical die roll.

```
> report = Randsum::D6.roll 4
#=> You rolled 4 d6, and got 11. (Rolls: [3, 2, 2, 4])

> new_report = report.drop_lowest
#=>  You rolled 3 d6, and got 9. (Rolls: [4, 3, 2])
```

Similarly, `#drop_highest` will remove the highest number in the `rolls` array.

```
> new_result = report.drop_highest
#=> You rolled 3 d6, and got 7. (Rolls: [2, 2, 3])
```

Both `#drop_lowest` and `#drop_highest` can also take an optional integer argument.

```
> result.drop_highest(2)
#=> You rolled 2 d6, and got 4. (Rolls: [2, 2])
```

### WHY IS THIS SO COMPLICATED

`Die#simple_roll` will just give you a random number, but where's the fun in that?

### Why build this?
[Rollr](http://github.com/alxjrvs/rollr) was one of the first things I ever built. I think it's funny, and I'm not sure why.

I recently had the privilege of attending Sandi Metz' POODNyc workshop, which involved a continual practice of refactoring the same "simple" problem over and over again.  I liked revisitng Rollr through the years, and Randsum reflects an attempt to use small refactoring techniques to continue to mull over the "simple" problem of random numbers.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RANDSUM/randsum. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
