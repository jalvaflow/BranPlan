require 'test_helper'

class RequirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @requirement = requirements(:one)
  end

  test "should get index" do
    get requirements_url
    assert_response :success
  end

  test "should get new" do
    get new_requirement_url
    assert_response :success
  end

  test "should create requirement" do
    assert_difference('Requirement.count') do
      post requirements_url, params: { requirement: { comment: @requirement.comment, long: @requirement.long, requirment_id: @requirement.requirment_id, short: @requirement.short } }
    end

    assert_redirected_to requirement_url(Requirement.last)
  end

  test "should show requirement" do
    get requirement_url(@requirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_requirement_url(@requirement)
    assert_response :success
  end

  test "should update requirement" do
    patch requirement_url(@requirement), params: { requirement: { comment: @requirement.comment, long: @requirement.long, requirment_id: @requirement.requirment_id, short: @requirement.short } }
    assert_redirected_to requirement_url(@requirement)
  end

  test "should destroy requirement" do
    assert_difference('Requirement.count', -1) do
      delete requirement_url(@requirement)
    end

    assert_redirected_to requirements_url
  end
end
