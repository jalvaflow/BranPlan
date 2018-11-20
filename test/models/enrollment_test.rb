require "test_helper"

describe Enrollment do
  let(:enrollment) { Enrollment.new }

  it "must be valid" do
    value(enrollment).must_be :valid?
  end
end
