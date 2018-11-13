require "test_helper"

describe Instructor do
  let(:instructor) { Instructor.new }

  it "must be valid" do
    value(instructor).must_be :valid?
  end
end
