require "test_helper"

describe InstructorsController do
  let(:instructor) { instructors :one }

  it "gets index" do
    get instructors_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_instructor_url
    value(response).must_be :success?
  end

  it "creates instructor" do
    expect {
      post instructors_url, params: { instructor: { comment: instructor.comment, email: instructor.email, first: instructor.first, instructor_id: instructor.instructor_id, last: instructor.last, middle: instructor.middle } }
    }.must_change "Instructor.count"

    must_redirect_to instructor_path(Instructor.last)
  end

  it "shows instructor" do
    get instructor_url(instructor)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_instructor_url(instructor)
    value(response).must_be :success?
  end

  it "updates instructor" do
    patch instructor_url(instructor), params: { instructor: { comment: instructor.comment, email: instructor.email, first: instructor.first, instructor_id: instructor.instructor_id, last: instructor.last, middle: instructor.middle } }
    must_redirect_to instructor_path(instructor)
  end

  it "destroys instructor" do
    expect {
      delete instructor_url(instructor)
    }.must_change "Instructor.count", -1

    must_redirect_to instructors_path
  end
end
