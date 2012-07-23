require 'minitest/autorun'
require 'rspec/expectations'
require 'set'

RSpec::Matchers.configuration.syntax = :expect

class MiniTest::Unit::TestCase
  include RSpec::Matchers

  # So each use of `expect` is counted as an assertion...
  def expect(*a, &b)
    assert(true)
    super
  end
end

# So expectation failures are considered failures, not errors.
MiniTest::Assertion = RSpec::Expectations::ExpectationNotMetError

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

