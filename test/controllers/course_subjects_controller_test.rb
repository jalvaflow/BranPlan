require 'test_helper'

class CourseSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_subject = course_subjects(:one)
  end

  test "should get index" do
    get course_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_course_subject_url
    assert_response :success
  end

  test "should create course_subject" do
    assert_difference('CourseSubject.count') do
      post course_subjects_url, params: { course_subject: { course_code: @course_subject.course_code, segment_id: @course_subject.segment_id, subject_id: @course_subject.subject_id } }
    end

    assert_redirected_to course_subject_url(CourseSubject.last)
  end

  test "should show course_subject" do
    get course_subject_url(@course_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_subject_url(@course_subject)
    assert_response :success
  end

  test "should update course_subject" do
    patch course_subject_url(@course_subject), params: { course_subject: { course_code: @course_subject.course_code, segment_id: @course_subject.segment_id, subject_id: @course_subject.subject_id } }
    assert_redirected_to course_subject_url(@course_subject)
  end

  test "should destroy course_subject" do
    assert_difference('CourseSubject.count', -1) do
      delete course_subject_url(@course_subject)
    end

    assert_redirected_to course_subjects_url
  end
end
