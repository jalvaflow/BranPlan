require "test_helper"

describe SubjectsController do
  let(:subject) { subjects :one }

  it "gets index" do
    get subjects_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_subject_url
    value(response).must_be :success?
  end

  it "creates subject" do
    expect {
      post subjects_url, params: { subject: { abbreviation: subject.abbreviation, comment: subject.comment, name: subject.name, subject_id: subject.subject_id, term: subject.term } }
    }.must_change "Subject.count"

    must_redirect_to subject_path(Subject.last)
  end

  it "shows subject" do
    get subject_url(subject)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_subject_url(subject)
    value(response).must_be :success?
  end

  it "updates subject" do
    patch subject_url(subject), params: { subject: { abbreviation: subject.abbreviation, comment: subject.comment, name: subject.name, subject_id: subject.subject_id, term: subject.term } }
    must_redirect_to subject_path(subject)
  end

  it "destroys subject" do
    expect {
      delete subject_url(subject)
    }.must_change "Subject.count", -1

    must_redirect_to subjects_path
  end
end
