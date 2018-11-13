require "test_helper"

describe CourseRequirement do
  let(:course_requirement) { CourseRequirement.new }

  it "must be valid" do
    value(course_requirement).must_be :valid?
  end
end
