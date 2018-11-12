require "application_system_test_case"

class InstructorsTest < ApplicationSystemTestCase
  setup do
    @instructor = instructors(:one)
  end

  test "visiting the index" do
    visit instructors_url
    assert_selector "h1", text: "Instructors"
  end

  test "creating a Instructor" do
    visit instructors_url
    click_on "New Instructor"

    fill_in "Comment", with: @instructor.comment
    fill_in "Email", with: @instructor.email
    fill_in "First", with: @instructor.first
    fill_in "Instructor", with: @instructor.instructor_id
    fill_in "Last", with: @instructor.last
    fill_in "Middle", with: @instructor.middle
    click_on "Create Instructor"

    assert_text "Instructor was successfully created"
    click_on "Back"
  end

  test "updating a Instructor" do
    visit instructors_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @instructor.comment
    fill_in "Email", with: @instructor.email
    fill_in "First", with: @instructor.first
    fill_in "Instructor", with: @instructor.instructor_id
    fill_in "Last", with: @instructor.last
    fill_in "Middle", with: @instructor.middle
    click_on "Update Instructor"

    assert_text "Instructor was successfully updated"
    click_on "Back"
  end

  test "destroying a Instructor" do
    visit instructors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instructor was successfully destroyed"
  end
end
