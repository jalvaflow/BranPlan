require "test_helper"

describe CoursesController do
  let(:course) { courses :one }

  it "gets index" do
    get courses_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_course_url
    value(response).must_be :success?
  end

  it "creates course" do
    expect {
      post courses_url, params: { course: { code: course.code, comment: course.comment, continuity_id: course.continuity_id, course_id: course.course_id, credits: course.credits, description: course.description, independent_study: course.independent_study, name: course.name, term: course.term } }
    }.must_change "Course.count"

    must_redirect_to course_path(Course.last)
  end

  it "shows course" do
    get course_url(course)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_course_url(course)
    value(response).must_be :success?
  end

  it "updates course" do
    patch course_url(course), params: { course: { code: course.code, comment: course.comment, continuity_id: course.continuity_id, course_id: course.course_id, credits: course.credits, description: course.description, independent_study: course.independent_study, name: course.name, term: course.term } }
    must_redirect_to course_path(course)
  end

  it "destroys course" do
    expect {
      delete course_url(course)
    }.must_change "Course.count", -1

    must_redirect_to courses_path
  end
end
