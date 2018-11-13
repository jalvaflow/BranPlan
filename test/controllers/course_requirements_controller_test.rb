require "test_helper"

describe CourseRequirementsController do
  let(:course_requirement) { course_requirements :one }

  it "gets index" do
    get course_requirements_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_course_requirement_url
    value(response).must_be :success?
  end

  it "creates course_requirement" do
    expect {
      post course_requirements_url, params: { course_requirement: { course_id: course_requirement.course_id, requirement: course_requirement.requirement } }
    }.must_change "CourseRequirement.count"

    must_redirect_to course_requirement_path(CourseRequirement.last)
  end

  it "shows course_requirement" do
    get course_requirement_url(course_requirement)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_course_requirement_url(course_requirement)
    value(response).must_be :success?
  end

  it "updates course_requirement" do
    patch course_requirement_url(course_requirement), params: { course_requirement: { course_id: course_requirement.course_id, requirement: course_requirement.requirement } }
    must_redirect_to course_requirement_path(course_requirement)
  end

  it "destroys course_requirement" do
    expect {
      delete course_requirement_url(course_requirement)
    }.must_change "CourseRequirement.count", -1

    must_redirect_to course_requirements_path
  end
end
