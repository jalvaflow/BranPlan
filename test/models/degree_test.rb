require "test_helper"

describe Degree do
  let(:degree) { Degree.new }

  it "must be valid" do
    value(degree).must_be :valid?
  end
end
