# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/side_effects/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-side_effects'
  spec.version       = Rspec::SideEffects::VERSION
  spec.authors       = ['Andrew Sullivan Cant']
  spec.email         = ['mail@andrewsullivancant.ca']

  spec.summary       = 'RSpec extension for examples with side effects.'
  spec.description   = 'DSL to make testing side effects clear and explicit.'
  spec.homepage      = 'http://github.com/sugarcrm/rspec-side_effects'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.1.2'

  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.add_dependency 'rspec-core', '>= 2.99.0'

  spec.add_development_dependency 'rake',  '~> 13.2'
  spec.add_development_dependency 'rspec', '~> 3.0'

  # Dependencies whose APIs we do not really depend upon, and can be upgraded
  # without limiting.
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'license_finder'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'yardstick'
end
