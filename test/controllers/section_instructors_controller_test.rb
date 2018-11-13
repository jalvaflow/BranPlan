require "test_helper"

describe SectionInstructorsController do
  let(:section_instructor) { section_instructors :one }

  it "gets index" do
    get section_instructors_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_section_instructor_url
    value(response).must_be :success?
  end

  it "creates section_instructor" do
    expect {
      post section_instructors_url, params: { section_instructor: { instructor_id: section_instructor.instructor_id, section_id: section_instructor.section_id } }
    }.must_change "SectionInstructor.count"

    must_redirect_to section_instructor_path(SectionInstructor.last)
  end

  it "shows section_instructor" do
    get section_instructor_url(section_instructor)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_section_instructor_url(section_instructor)
    value(response).must_be :success?
  end

  it "updates section_instructor" do
    patch section_instructor_url(section_instructor), params: { section_instructor: { instructor_id: section_instructor.instructor_id, section_id: section_instructor.section_id } }
    must_redirect_to section_instructor_path(section_instructor)
  end

  it "destroys section_instructor" do
    expect {
      delete section_instructor_url(section_instructor)
    }.must_change "SectionInstructor.count", -1

    must_redirect_to section_instructors_path
  end
end
