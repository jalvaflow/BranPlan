require "test_helper"

describe CourseSubject do
  let(:course_subject) { CourseSubject.new }

  it "must be valid" do
    value(course_subject).must_be :valid?
  end
end
