require 'spec_helper'

class TestClass
  def initialize
    @var1 = nil
    @var2 = nil
    @var3 = nil
  end

  # @return [void]
  def test1
    @var1 = :var1
  end

  # @return [void]
  def test2
    @var2 = :var2
    inner_test
  end

  # @return [void]
  def inner_test
    @var3 = :var3
  end
end

RSpec.describe Rspec::SideEffects do
  subject(:test_class) { TestClass.new }

  describe '#its_side_effects_are' do
    subject { test_class.test1 }

    its_side_effects_are do
      expect(test_class.instance_variable_get('@var1')).to eq(:var1)
      expect(test_class.instance_variable_get('@var2')).to eq(nil)
      expect(test_class.instance_variable_get('@var3')).to eq(nil)
    end
  end

  describe '#it_has_side_effects' do
    subject { test_class.test2 }

    before do
      # rubocop:disable RSpec/ExpectInHook, RSpec/MessageSpies
      expect(test_class).to receive(:inner_test)
      # rubocop:enable RSpec/ExpectInHook, RSpec/MessageSpies
    end

    it_has_side_effects
  end

  describe '#specify_side_effects' do
    subject { test_class.test1 }

    specify_side_effects do
      expect(test_class.instance_variable_get('@var1')).to eq(:var1)
    end
  end
end
