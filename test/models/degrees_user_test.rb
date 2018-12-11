require "test_helper"

describe DegreesUser do
  let(:degrees_user) { DegreesUser.new }

  it "must be valid" do
    value(degrees_user).must_be :valid?
  end
end
