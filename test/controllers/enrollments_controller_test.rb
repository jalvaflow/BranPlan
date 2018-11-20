require "test_helper"

describe EnrollmentsController do
  let(:enrollment) { enrollments :one }

  it "gets index" do
    get enrollments_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_enrollment_url
    value(response).must_be :success?
  end

  it "creates enrollment" do
    expect {
      post enrollments_url, params: { enrollment: { course_id: enrollment.course_id, user_id: enrollment.user_id } }
    }.must_change "Enrollment.count"

    must_redirect_to enrollment_path(Enrollment.last)
  end

  it "shows enrollment" do
    get enrollment_url(enrollment)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_enrollment_url(enrollment)
    value(response).must_be :success?
  end

  it "updates enrollment" do
    patch enrollment_url(enrollment), params: { enrollment: { course_id: enrollment.course_id, user_id: enrollment.user_id } }
    must_redirect_to enrollment_path(enrollment)
  end

  it "destroys enrollment" do
    expect {
      delete enrollment_url(enrollment)
    }.must_change "Enrollment.count", -1

    must_redirect_to enrollments_path
  end
end
