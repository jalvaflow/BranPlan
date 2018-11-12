require "application_system_test_case"

class SectionTimesTest < ApplicationSystemTestCase
  setup do
    @section_time = section_times(:one)
  end

  test "visiting the index" do
    visit section_times_url
    assert_selector "h1", text: "Section Times"
  end

  test "creating a Section time" do
    visit section_times_url
    click_on "New Section Time"

    fill_in "Building", with: @section_time.building
    fill_in "Days", with: @section_time.days
    fill_in "End", with: @section_time.end
    fill_in "Room", with: @section_time.room
    fill_in "Section", with: @section_time.section_id
    fill_in "Start", with: @section_time.start
    fill_in "Type", with: @section_time.type
    click_on "Create Section time"

    assert_text "Section time was successfully created"
    click_on "Back"
  end

  test "updating a Section time" do
    visit section_times_url
    click_on "Edit", match: :first

    fill_in "Building", with: @section_time.building
    fill_in "Days", with: @section_time.days
    fill_in "End", with: @section_time.end
    fill_in "Room", with: @section_time.room
    fill_in "Section", with: @section_time.section_id
    fill_in "Start", with: @section_time.start
    fill_in "Type", with: @section_time.type
    click_on "Update Section time"

    assert_text "Section time was successfully updated"
    click_on "Back"
  end

  test "destroying a Section time" do
    visit section_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section time was successfully destroyed"
  end
end
