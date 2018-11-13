require "test_helper"

describe SectionsController do
  let(:section) { sections :one }

  it "gets index" do
    get sections_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_section_url
    value(response).must_be :success?
  end

  it "creates section" do
    expect {
      post sections_url, params: { section: { comment: section.comment, course: section.course, details: section.details, enrolled: section.enrolled, limit: section.limit, section: section.section, section_id: section.section_id, status: section.status, status_text: section.status_text, waiting: section.waiting } }
    }.must_change "Section.count"

    must_redirect_to section_path(Section.last)
  end

  it "shows section" do
    get section_url(section)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_section_url(section)
    value(response).must_be :success?
  end

  it "updates section" do
    patch section_url(section), params: { section: { comment: section.comment, course: section.course, details: section.details, enrolled: section.enrolled, limit: section.limit, section: section.section, section_id: section.section_id, status: section.status, status_text: section.status_text, waiting: section.waiting } }
    must_redirect_to section_path(section)
  end

  it "destroys section" do
    expect {
      delete section_url(section)
    }.must_change "Section.count", -1

    must_redirect_to sections_path
  end
end
