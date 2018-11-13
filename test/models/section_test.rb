require "test_helper"

describe Section do
  let(:section) { Section.new }

  it "must be valid" do
    value(section).must_be :valid?
  end
end
