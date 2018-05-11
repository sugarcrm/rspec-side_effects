# Rspec::SideEffects

[![Gem Version](https://badge.fury.io/rb/rspec-side_effects.svg)](http://badge.fury.io/rb/rspec-side_effects)
[![Dependency Status](https://gemnasium.com/sugarcrm/rspec-side_effects.svg)](https://gemnasium.com/sugarcrm/rspec-side_effects)
[![Build Status](https://travis-ci.org/sugarcrm/rspec-side_effects.svg?branch=master)](https://travis-ci.org/sugarcrm/rspec-side_effects)
[![Code Climate](https://codeclimate.com/github/sugarcrm/rspec-side_effects/badges/gpa.svg)](https://codeclimate.com/github/sugarcrm/rspec-side_effects)
[![Test Coverage](https://codeclimate.com/github/sugarcrm/rspec-side_effects/badges/coverage.svg)](https://codeclimate.com/github/sugarcrm/rspec-side_effects/coverage)
[![Inline docs](http://inch-ci.org/github/sugarcrm/rspec-side_effects.svg)](http://inch-ci.org/github/sugarcrm/rspec-side_effects)
[![License](http://img.shields.io/badge/license-Apache2-green.svg?style=flat)](LICENSE)

RSpec extension for checking the side effects of your specifications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-side_effects'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-side_effects

## Usage

This gem is intended to replace explicitly calling the *subject* before checking
its side effects. It might be used when testing things like:
* method which works directly with a database
* method which works directly with a file system
* method which only integrates mocked objects

There are several aliases for *it_has_side_effects_are* which can be used to
communicate different things to the reader.

```
subject { test_class.test }

its_side_effects_are do
  # Check a side effect, such as writing to the file system.
  # Check a have_received expectation
end
```

Or leave out the block and only check expectations which are already setup.

```
subject { test_class.test }

before do
  # Setup an expecation for the method call
end

end

it_has_side_effects
```

Both of these examples are testing methods where you do not care about the
return value. When you do care about the return value and the side effects, you
can do that too.

```
subject { test_class.test }

it { is_expected.to eq(:result) }
its_side_effects_are do
  # Check a side effect, such as writing to the file system.
  # Check a have_received expectation
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for how you can contribute changes back into this project.

## Acknowledgments

Copyright 2018 [SugarCRM Inc.](http://sugarcrm.com), released under the Apache2 License.
