require "test_helper"

describe UserCourseHistory do
  let(:user_course_history) { UserCourseHistory.new }

  it "must be valid" do
    value(user_course_history).must_be :valid?
  end
end
