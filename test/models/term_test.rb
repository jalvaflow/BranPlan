require "test_helper"

describe Term do
  let(:term) { Term.new }

  it "must be valid" do
    value(term).must_be :valid?
  end
end
