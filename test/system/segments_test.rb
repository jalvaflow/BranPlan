require "application_system_test_case"

class SegmentsTest < ApplicationSystemTestCase
  setup do
    @segment = segments(:one)
  end

  test "visiting the index" do
    visit segments_url
    assert_selector "h1", text: "Segments"
  end

  test "creating a Segment" do
    visit segments_url
    click_on "New Segment"

    fill_in "Name", with: @segment.name
    fill_in "Segment", with: @segment.segment_id
    fill_in "Subject", with: @segment.subject_id
    click_on "Create Segment"

    assert_text "Segment was successfully created"
    click_on "Back"
  end

  test "updating a Segment" do
    visit segments_url
    click_on "Edit", match: :first

    fill_in "Name", with: @segment.name
    fill_in "Segment", with: @segment.segment_id
    fill_in "Subject", with: @segment.subject_id
    click_on "Update Segment"

    assert_text "Segment was successfully updated"
    click_on "Back"
  end

  test "destroying a Segment" do
    visit segments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Segment was successfully destroyed"
  end
end
