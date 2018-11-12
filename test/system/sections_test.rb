require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "creating a Section" do
    visit sections_url
    click_on "New Section"

    fill_in "Comment", with: @section.comment
    fill_in "Course", with: @section.course
    fill_in "Details", with: @section.details
    fill_in "Enrolled", with: @section.enrolled
    fill_in "Limit", with: @section.limit
    fill_in "Section", with: @section.section
    fill_in "Section", with: @section.section_id
    fill_in "Status", with: @section.status
    fill_in "Status Text", with: @section.status_text
    fill_in "Waiting", with: @section.waiting
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "updating a Section" do
    visit sections_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @section.comment
    fill_in "Course", with: @section.course
    fill_in "Details", with: @section.details
    fill_in "Enrolled", with: @section.enrolled
    fill_in "Limit", with: @section.limit
    fill_in "Section", with: @section.section
    fill_in "Section", with: @section.section_id
    fill_in "Status", with: @section.status
    fill_in "Status Text", with: @section.status_text
    fill_in "Waiting", with: @section.waiting
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "destroying a Section" do
    visit sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
