![Specs status](https://github.com/paddor/async-eventmachine/workflows/Specs/badge.svg)

# Async::EventMachine

This gem aims to become a drop-in replacement for EventMachine on top of the Async library.


## Todo

* [X] `EM.run` and `EM.stop`
* [X] `EM::Timer` and `EM.add_timer`
* [X] `EM::PeriodicTimer` and `EM.add_periodic_timer`
* [X] `EM.cancel_timer`
* [ ] `EM.next_tick` and `EM.schedule`
* [ ] `EM.add_shutdown_hook`
* [ ] `EM.connect`
* [ ] `EM.start_server`
* [ ] `EM::Connection`
* [ ] `EM.watch`
* [ ] `EM.watch_file`
* [ ] `EM::DNS`
* [ ] `EM::Deferrable`
* [ ] `EM::Pool`

PRs welcome. ;-)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'async-eventmachine'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install async-eventmachine

## Usage

```ruby
require 'eventmachine'

fail unless EM == Async::EventMachine

EM.run do
  EM.add_periodic_timer 1 do
    puts "Hello from Async::EventMachine!"
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paddor/async-eventmachine.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
