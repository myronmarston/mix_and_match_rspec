RSpec.configure do |rspec|
  rspec.mock_with :flexmock
end

describe "RSpec and Flexmock" do
  specify "a passing mock" do
    foo = flexmock("foo")
    foo.should_receive(:bar).once
    foo.bar
  end

  specify "a failing mock" do
    foo = flexmock("foo")
    foo.should_receive(:bar).once
  end

  specify "stubbing a real object" do
    foo = Object.new
    flexmock(foo, "foo", bar: 3)
    expect(foo.bar).to eq(3)
  end
end

