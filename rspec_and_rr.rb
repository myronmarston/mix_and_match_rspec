RSpec.configure do |rspec|
  rspec.mock_with :rr
end

describe "RSpec and RR" do
  specify "a passing mock" do
    mock(foo = Object.new).bar
    foo.bar
  end

  specify "a failing mock" do
    mock(foo = Object.new).bar
  end

  specify "stubbing a real object" do
    foo = Object.new
    stub(foo).bar { 3 }
    expect(foo.bar).to eq(3)
  end
end

