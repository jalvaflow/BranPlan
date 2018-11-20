require "test_helper"

describe Event do
  let(:event) { Event.new }

  it "must be valid" do
    value(event).must_be :valid?
  end
end
