require 'spec_helper'

RSpec.describe Rspec::SideEffects do
  it 'has a version number' do
    expect(Rspec::SideEffects::VERSION).not_to be nil
  end
end
