require 'test_helper'

class SectionInstructorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section_instructor = section_instructors(:one)
  end

  test "should get index" do
    get section_instructors_url
    assert_response :success
  end

  test "should get new" do
    get new_section_instructor_url
    assert_response :success
  end

  test "should create section_instructor" do
    assert_difference('SectionInstructor.count') do
      post section_instructors_url, params: { section_instructor: { instructor_id: @section_instructor.instructor_id, section_id: @section_instructor.section_id } }
    end

    assert_redirected_to section_instructor_url(SectionInstructor.last)
  end

  test "should show section_instructor" do
    get section_instructor_url(@section_instructor)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_instructor_url(@section_instructor)
    assert_response :success
  end

  test "should update section_instructor" do
    patch section_instructor_url(@section_instructor), params: { section_instructor: { instructor_id: @section_instructor.instructor_id, section_id: @section_instructor.section_id } }
    assert_redirected_to section_instructor_url(@section_instructor)
  end

  test "should destroy section_instructor" do
    assert_difference('SectionInstructor.count', -1) do
      delete section_instructor_url(@section_instructor)
    end

    assert_redirected_to section_instructors_url
  end
end
