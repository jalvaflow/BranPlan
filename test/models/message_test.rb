require "test_helper"

describe Message do
  let(:message) { Message.new }

  it "must be valid" do
    value(message).must_be :valid?
  end
end
