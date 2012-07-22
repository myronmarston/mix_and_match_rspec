require 'set'

RSpec.configure do |rspec|
  rspec.expect_with :stdlib
end

describe Set do
  specify "a passing example" do
    set = Set.new
    set << 3 << 4
    assert_include set, 3
  end

  specify "a failing example" do
    set = Set.new
    set << 3 << 4
    assert_include set, 5
  end
end

