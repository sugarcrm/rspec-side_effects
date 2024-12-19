# frozen_string_literal: true

require 'bundler/setup'

# Setup code coverage
require 'simplecov'
require 'simplecov-lcov'
require 'simplecov_json_formatter'
SimpleCov.start do
  # NOTE: Include the lcov formatter for CodeClimate reporting.
  # Even though the simplecov JSON format will be output and used by default,
  # the test reporter does not handle it reliable.
  # Using the lcov formatter is more reliable.
  SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new(
    [
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::JSONFormatter,
      SimpleCov::Formatter::LcovFormatter
    ]
  )
end

require 'rspec/side_effects'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
