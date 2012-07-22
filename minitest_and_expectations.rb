require 'minitest/autorun'
require 'rspec/expectations'
require 'set'

MiniTest::Unit::TestCase.send(:include, RSpec::Matchers)
RSpec::Matchers.configuration.syntax = :expect

class TestSet < MiniTest::Unit::TestCase
  def test_passing_expectation
    set = Set.new
    set << 3 << 4 << 3
    expect(set.to_a).to match_array([3, 4])
  end

  def test_failing_expectation
    set = Set.new
    set << 3 << 4
    expect(set).to include(5)
  end
end

