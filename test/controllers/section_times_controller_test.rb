require "test_helper"

describe SectionTimesController do
  let(:section_time) { section_times :one }

  it "gets index" do
    get section_times_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_section_time_url
    value(response).must_be :success?
  end

  it "creates section_time" do
    expect {
      post section_times_url, params: { section_time: { building: section_time.building, days: section_time.days, end: section_time.end, room: section_time.room, section_id: section_time.section_id, section_type: section_time.section_type, start: section_time.start } }
    }.must_change "SectionTime.count"

    must_redirect_to section_time_path(SectionTime.last)
  end

  it "shows section_time" do
    get section_time_url(section_time)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_section_time_url(section_time)
    value(response).must_be :success?
  end

  it "updates section_time" do
    patch section_time_url(section_time), params: { section_time: { building: section_time.building, days: section_time.days, end: section_time.end, room: section_time.room, section_id: section_time.section_id, section_type: section_time.section_type, start: section_time.start } }
    must_redirect_to section_time_path(section_time)
  end

  it "destroys section_time" do
    expect {
      delete section_time_url(section_time)
    }.must_change "SectionTime.count", -1

    must_redirect_to section_times_path
  end
end
