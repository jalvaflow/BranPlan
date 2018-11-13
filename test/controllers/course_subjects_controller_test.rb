require "test_helper"

describe CourseSubjectsController do
  let(:course_subject) { course_subjects :one }

  it "gets index" do
    get course_subjects_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_course_subject_url
    value(response).must_be :success?
  end

  it "creates course_subject" do
    expect {
      post course_subjects_url, params: { course_subject: { course_code: course_subject.course_code, segment_id: course_subject.segment_id, subject_id: course_subject.subject_id } }
    }.must_change "CourseSubject.count"

    must_redirect_to course_subject_path(CourseSubject.last)
  end

  it "shows course_subject" do
    get course_subject_url(course_subject)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_course_subject_url(course_subject)
    value(response).must_be :success?
  end

  it "updates course_subject" do
    patch course_subject_url(course_subject), params: { course_subject: { course_code: course_subject.course_code, segment_id: course_subject.segment_id, subject_id: course_subject.subject_id } }
    must_redirect_to course_subject_path(course_subject)
  end

  it "destroys course_subject" do
    expect {
      delete course_subject_url(course_subject)
    }.must_change "CourseSubject.count", -1

    must_redirect_to course_subjects_path
  end
end
