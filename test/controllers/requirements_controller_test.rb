require "test_helper"

describe RequirementsController do
  let(:requirement) { requirements :one }

  it "gets index" do
    get requirements_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_requirement_url
    value(response).must_be :success?
  end

  it "creates requirement" do
    expect {
      post requirements_url, params: { requirement: { comment: requirement.comment, long: requirement.long, requirement_id: requirement.requirement_id, short: requirement.short } }
    }.must_change "Requirement.count"

    must_redirect_to requirement_path(Requirement.last)
  end

  it "shows requirement" do
    get requirement_url(requirement)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_requirement_url(requirement)
    value(response).must_be :success?
  end

  it "updates requirement" do
    patch requirement_url(requirement), params: { requirement: { comment: requirement.comment, long: requirement.long, requirement_id: requirement.requirement_id, short: requirement.short } }
    must_redirect_to requirement_path(requirement)
  end

  it "destroys requirement" do
    expect {
      delete requirement_url(requirement)
    }.must_change "Requirement.count", -1

    must_redirect_to requirements_path
  end
end
