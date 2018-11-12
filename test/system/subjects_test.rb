require "application_system_test_case"

class SubjectsTest < ApplicationSystemTestCase
  setup do
    @subject = subjects(:one)
  end

  test "visiting the index" do
    visit subjects_url
    assert_selector "h1", text: "Subjects"
  end

  test "creating a Subject" do
    visit subjects_url
    click_on "New Subject"

    fill_in "Abbreviation", with: @subject.abbreviation
    fill_in "Comment", with: @subject.comment
    fill_in "Name", with: @subject.name
    fill_in "Subject", with: @subject.subject_id
    fill_in "Term", with: @subject.term
    click_on "Create Subject"

    assert_text "Subject was successfully created"
    click_on "Back"
  end

  test "updating a Subject" do
    visit subjects_url
    click_on "Edit", match: :first

    fill_in "Abbreviation", with: @subject.abbreviation
    fill_in "Comment", with: @subject.comment
    fill_in "Name", with: @subject.name
    fill_in "Subject", with: @subject.subject_id
    fill_in "Term", with: @subject.term
    click_on "Update Subject"

    assert_text "Subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Subject" do
    visit subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject was successfully destroyed"
  end
end
