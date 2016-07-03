# Moreutils

Ruby version of joeyh's [moreutils](http://joeyh.name/code/moreutils/) collection.

Practically, you should just use the actual moreutils collection. This is simply an exercise in translating those utils to Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moreutils'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moreutils

## Usage

Available tools:

- chronic: runs a command quietly unless it fails
- combine: combine the lines in two files using boolean operations
- errno: look up errno names and descriptions

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dubdromic/moreutils.

