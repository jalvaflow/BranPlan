require "application_system_test_case"

class CourseSubjectsTest < ApplicationSystemTestCase
  setup do
    @course_subject = course_subjects(:one)
  end

  test "visiting the index" do
    visit course_subjects_url
    assert_selector "h1", text: "Course Subjects"
  end

  test "creating a Course subject" do
    visit course_subjects_url
    click_on "New Course Subject"

    fill_in "Course Code", with: @course_subject.course_code
    fill_in "Segment", with: @course_subject.segment_id
    fill_in "Subject", with: @course_subject.subject_id
    click_on "Create Course subject"

    assert_text "Course subject was successfully created"
    click_on "Back"
  end

  test "updating a Course subject" do
    visit course_subjects_url
    click_on "Edit", match: :first

    fill_in "Course Code", with: @course_subject.course_code
    fill_in "Segment", with: @course_subject.segment_id
    fill_in "Subject", with: @course_subject.subject_id
    click_on "Update Course subject"

    assert_text "Course subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Course subject" do
    visit course_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course subject was successfully destroyed"
  end
end
