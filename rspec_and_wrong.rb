require 'set'
require 'wrong'

RSpec.configure do |rspec|
  rspec.expect_with Wrong
end

describe Set do
  specify "a passing example" do
    set = Set.new
    set << 3 << 4
    assert { set.include?(3) }
  end

  specify "a failing example" do
    set = Set.new
    set << 3 << 4
    assert { set.include?(5) }
  end
end

