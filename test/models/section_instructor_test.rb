require "test_helper"

describe SectionInstructor do
  let(:section_instructor) { SectionInstructor.new }

  it "must be valid" do
    value(section_instructor).must_be :valid?
  end
end
