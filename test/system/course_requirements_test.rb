require "application_system_test_case"

class CourseRequirementsTest < ApplicationSystemTestCase
  setup do
    @course_requirement = course_requirements(:one)
  end

  test "visiting the index" do
    visit course_requirements_url
    assert_selector "h1", text: "Course Requirements"
  end

  test "creating a Course requirement" do
    visit course_requirements_url
    click_on "New Course Requirement"

    fill_in "Course", with: @course_requirement.course_id
    fill_in "Requirement", with: @course_requirement.requirement
    click_on "Create Course requirement"

    assert_text "Course requirement was successfully created"
    click_on "Back"
  end

  test "updating a Course requirement" do
    visit course_requirements_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_requirement.course_id
    fill_in "Requirement", with: @course_requirement.requirement
    click_on "Update Course requirement"

    assert_text "Course requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Course requirement" do
    visit course_requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course requirement was successfully destroyed"
  end
end
