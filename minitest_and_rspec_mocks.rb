require 'minitest/autorun'
require 'rspec/mocks'
require 'set'

MiniTest::Unit::TestCase.add_setup_hook do |test_case|
  RSpec::Mocks.setup(test_case)
end

MiniTest::Unit::TestCase.add_teardown_hook do |test_case|
  begin
    RSpec::Mocks.verify
  ensure
    RSpec::Mocks.teardown
  end
end

class TestSet < MiniTest::Unit::TestCase
  def test_passing_mock
    foo = mock
    foo.should_receive(:bar)
    foo.bar
  end

  def test_failing_mock
    foo = mock
    foo.should_receive(:bar)
  end

  def test_stub_real_object
    Object.stub(:foo => "bar")
    assert_equal "bar", Object.foo
  end

  def test_real_object_stubs_dont_leak
    assert_raises NoMethodError do
      Object.foo
    end
  end
end

