require "test_helper"

describe Course do
  let(:course) { Course.new }

  it "must be valid" do
    value(course).must_be :valid?
  end
end
