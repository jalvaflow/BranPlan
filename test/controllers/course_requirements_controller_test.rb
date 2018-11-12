require 'test_helper'

class CourseRequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_requirement = course_requirements(:one)
  end

  test "should get index" do
    get course_requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_course_requirement_url
    assert_response :success
  end

  test "should create course_requirement" do
    assert_difference('CourseRequirement.count') do
      post course_requirements_url, params: { course_requirement: { course_id: @course_requirement.course_id, requirement: @course_requirement.requirement } }
    end

    assert_redirected_to course_requirement_url(CourseRequirement.last)
  end

  test "should show course_requirement" do
    get course_requirement_url(@course_requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_requirement_url(@course_requirement)
    assert_response :success
  end

  test "should update course_requirement" do
    patch course_requirement_url(@course_requirement), params: { course_requirement: { course_id: @course_requirement.course_id, requirement: @course_requirement.requirement } }
    assert_redirected_to course_requirement_url(@course_requirement)
  end

  test "should destroy course_requirement" do
    assert_difference('CourseRequirement.count', -1) do
      delete course_requirement_url(@course_requirement)
    end

    assert_redirected_to course_requirements_url
  end
end
