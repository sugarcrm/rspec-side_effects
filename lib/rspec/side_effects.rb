require 'rspec/side_effects/version'

module Rspec
  # This module will allow the side effects of RSpec examples to be written more
  # clearly and consistently.
  #
  # @example
  module SideEffects
    def its_side_effects_are(*options, &block)
      its_caller = caller.reject { |file_line| file_line =~ /its_side_effects/ }
      if options.last.is_a?(Hash)
        options.last.merge(called: its_caller)
      else
        options.push(called: its_caller)
      end

      describe('side effects', *options) do
        if block
          before do
            # rubocop:disable Lint/HandleExceptions, Lint/RescueException
            begin; subject; rescue Exception; end
            # rubocop:enable Lint/HandleExceptions, Lint/RescueException
          end
          example(nil, :aggregate_failures, *options, &block)
        else
          example(nil, {}) { subject }
        end
      end
    end

    alias it_has_side_effects  its_side_effects_are
    alias specify_side_effects its_side_effects_are
  end
end

RSpec.configure do |config|
  config.extend(Rspec::SideEffects)
end
