require "test_helper"

describe DegreesController do
  let(:degree) { degrees :one }

  it "gets index" do
    get degrees_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_degree_url
    value(response).must_be :success?
  end

  it "creates degree" do
    expect {
      post degrees_url, params: { degree: { core_courses: degree.core_courses, cores: degree.cores, degree_type: degree.degree_type, description: degree.description, elective_courses: degree.elective_courses, electives: degree.electives, name: degree.name, site_link: degree.site_link } }
    }.must_change "Degree.count"

    must_redirect_to degree_path(Degree.last)
  end

  it "shows degree" do
    get degree_url(degree)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_degree_url(degree)
    value(response).must_be :success?
  end

  it "updates degree" do
    patch degree_url(degree), params: { degree: { core_courses: degree.core_courses, cores: degree.cores, degree_type: degree.degree_type, description: degree.description, elective_courses: degree.elective_courses, electives: degree.electives, name: degree.name, site_link: degree.site_link } }
    must_redirect_to degree_path(degree)
  end

  it "destroys degree" do
    expect {
      delete degree_url(degree)
    }.must_change "Degree.count", -1

    must_redirect_to degrees_path
  end
end
