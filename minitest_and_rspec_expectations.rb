require 'minitest/autorun'
require 'rspec/expectations'
require 'set'

RSpec::Matchers.configuration.syntax = :expect

module MiniTest
  remove_const :Assertion # so we can re-assign it w/o a ruby warning

  # So expectation failures are considered failures, not errors.
  Assertion = RSpec::Expectations::ExpectationNotMetError

  class Unit::TestCase
    include RSpec::Matchers

    # So each use of `expect` is counted as an assertion...
    def expect(*a, &b)
      assert(true)
      super
    end
  end
end

class TestSet < MiniTest::Unit::TestCase
  def test_passing_expectation
    set = Set.new
    set << 3 << 4
    expect(set).to include(3)
  end

  def test_failing_expectation
    set = Set.new
    set << 3 << 4
    expect(set).to include(5)
  end
end

