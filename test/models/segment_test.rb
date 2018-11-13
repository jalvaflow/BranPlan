require "test_helper"

describe Segment do
  let(:segment) { Segment.new }

  it "must be valid" do
    value(segment).must_be :valid?
  end
end
