require "application_system_test_case"

class SectionInstructorsTest < ApplicationSystemTestCase
  setup do
    @section_instructor = section_instructors(:one)
  end

  test "visiting the index" do
    visit section_instructors_url
    assert_selector "h1", text: "Section Instructors"
  end

  test "creating a Section instructor" do
    visit section_instructors_url
    click_on "New Section Instructor"

    fill_in "Instructor", with: @section_instructor.instructor_id
    fill_in "Section", with: @section_instructor.section_id
    click_on "Create Section instructor"

    assert_text "Section instructor was successfully created"
    click_on "Back"
  end

  test "updating a Section instructor" do
    visit section_instructors_url
    click_on "Edit", match: :first

    fill_in "Instructor", with: @section_instructor.instructor_id
    fill_in "Section", with: @section_instructor.section_id
    click_on "Update Section instructor"

    assert_text "Section instructor was successfully updated"
    click_on "Back"
  end

  test "destroying a Section instructor" do
    visit section_instructors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section instructor was successfully destroyed"
  end
end
