require "test_helper"

describe UserDegreesController do
  let(:user_degree) { user_degrees :one }

  it "gets index" do
    get user_degrees_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_user_degree_url
    value(response).must_be :success?
  end

  it "creates user_degree" do
    expect {
      post user_degrees_url, params: { user_degree: { degree_id: user_degree.degree_id, user_id: user_degree.user_id } }
    }.must_change "UserDegree.count"

    must_redirect_to user_degree_path(UserDegree.last)
  end

  it "shows user_degree" do
    get user_degree_url(user_degree)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_user_degree_url(user_degree)
    value(response).must_be :success?
  end

  it "updates user_degree" do
    patch user_degree_url(user_degree), params: { user_degree: { degree_id: user_degree.degree_id, user_id: user_degree.user_id } }
    must_redirect_to user_degree_path(user_degree)
  end

  it "destroys user_degree" do
    expect {
      delete user_degree_url(user_degree)
    }.must_change "UserDegree.count", -1

    must_redirect_to user_degrees_path
  end
end
