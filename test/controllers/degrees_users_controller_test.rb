require "test_helper"

describe DegreesUsersController do
  let(:degrees_user) { degrees_users :one }

  it "gets index" do
    get degrees_users_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_degrees_user_url
    value(response).must_be :success?
  end

  it "creates degrees_user" do
    expect {
      post degrees_users_url, params: { degrees_user: { degree_id: degrees_user.degree_id, user_id: degrees_user.user_id } }
    }.must_change "DegreesUser.count"

    must_redirect_to degrees_user_path(DegreesUser.last)
  end

  it "shows degrees_user" do
    get degrees_user_url(degrees_user)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_degrees_user_url(degrees_user)
    value(response).must_be :success?
  end

  it "updates degrees_user" do
    patch degrees_user_url(degrees_user), params: { degrees_user: { degree_id: degrees_user.degree_id, user_id: degrees_user.user_id } }
    must_redirect_to degrees_user_path(degrees_user)
  end

  it "destroys degrees_user" do
    expect {
      delete degrees_user_url(degrees_user)
    }.must_change "DegreesUser.count", -1

    must_redirect_to degrees_users_path
  end
end
