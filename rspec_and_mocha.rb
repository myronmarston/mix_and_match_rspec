RSpec.configure do |rspec|
  rspec.mock_with :mocha
end

describe "RSpec and Mocha" do
  specify "a passing mock" do
    foo = mock
    foo.expects(:bar)
    foo.bar
  end

  specify "a failing mock" do
    foo = mock
    foo.expects(:bar)
  end

  specify "stubbing a real object" do
    foo = Object.new
    foo.stubs(bar: 3)
    expect(foo.bar).to eq(3)
  end
end

