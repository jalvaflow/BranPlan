require "test_helper"

describe Requirement do
  let(:requirement) { Requirement.new }

  it "must be valid" do
    value(requirement).must_be :valid?
  end
end
