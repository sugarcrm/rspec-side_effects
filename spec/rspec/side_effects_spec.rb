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

  # @raise [StandardError]
  def test_standard_error
    @standard_error = :standard_error
    raise(StandardError)
  end

  # @raise [Exception]
  def test_exception
    @exception = :exception
    raise(Exception)
  end
end

RSpec.describe Rspec::SideEffects do
  subject(:test_class) { TestClass.new }

  # @param [#to_s] variable_name
  def expect_instance_variable(variable_name)
    expect(test_class.instance_variable_get("@#{variable_name}"))
  end

  describe '#its_side_effects_are' do
    context 'when no exception' do
      subject { test_class.test1 }

      its_side_effects_are do
        expect_instance_variable(:var1).to eq(:var1)
        expect_instance_variable(:var2).to eq(nil)
        expect_instance_variable(:var3).to eq(nil)
      end
    end

    context 'when StandardError' do
      subject { test_class.test_standard_error }

      its_side_effects_are do
        expect_instance_variable(:standard_error).to eq(:standard_error)
      end
    end

    context 'when Exception' do
      subject { test_class.test_exception }

      its_side_effects_are do
        expect_instance_variable(:exception).to eq(:exception)
      end
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
      expect_instance_variable(:var1).to eq(:var1)
      expect_instance_variable(:var2).to eq(nil)
      expect_instance_variable(:var3).to eq(nil)
    end
  end
end
