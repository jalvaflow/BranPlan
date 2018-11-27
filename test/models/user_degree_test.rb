require "test_helper"

describe UserDegree do
  let(:user_degree) { UserDegree.new }

  it "must be valid" do
    value(user_degree).must_be :valid?
  end
end
