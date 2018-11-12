require 'test_helper'

class SectionTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section_time = section_times(:one)
  end

  test "should get index" do
    get section_times_url
    assert_response :success
  end

  test "should get new" do
    get new_section_time_url
    assert_response :success
  end

  test "should create section_time" do
    assert_difference('SectionTime.count') do
      post section_times_url, params: { section_time: { building: @section_time.building, days: @section_time.days, end: @section_time.end, room: @section_time.room, section_id: @section_time.section_id, start: @section_time.start, type: @section_time.type } }
    end

    assert_redirected_to section_time_url(SectionTime.last)
  end

  test "should show section_time" do
    get section_time_url(@section_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_time_url(@section_time)
    assert_response :success
  end

  test "should update section_time" do
    patch section_time_url(@section_time), params: { section_time: { building: @section_time.building, days: @section_time.days, end: @section_time.end, room: @section_time.room, section_id: @section_time.section_id, start: @section_time.start, type: @section_time.type } }
    assert_redirected_to section_time_url(@section_time)
  end

  test "should destroy section_time" do
    assert_difference('SectionTime.count', -1) do
      delete section_time_url(@section_time)
    end

    assert_redirected_to section_times_url
  end
end
