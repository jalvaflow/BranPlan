require "test_helper"

describe SectionTime do
  let(:section_time) { SectionTime.new }

  it "must be valid" do
    value(section_time).must_be :valid?
  end
end
