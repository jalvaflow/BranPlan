require "test_helper"

describe SegmentsController do
  let(:segment) { segments :one }

  it "gets index" do
    get segments_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_segment_url
    value(response).must_be :success?
  end

  it "creates segment" do
    expect {
      post segments_url, params: { segment: { name: segment.name, segment_id: segment.segment_id, subject_id: segment.subject_id } }
    }.must_change "Segment.count"

    must_redirect_to segment_path(Segment.last)
  end

  it "shows segment" do
    get segment_url(segment)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_segment_url(segment)
    value(response).must_be :success?
  end

  it "updates segment" do
    patch segment_url(segment), params: { segment: { name: segment.name, segment_id: segment.segment_id, subject_id: segment.subject_id } }
    must_redirect_to segment_path(segment)
  end

  it "destroys segment" do
    expect {
      delete segment_url(segment)
    }.must_change "Segment.count", -1

    must_redirect_to segments_path
  end
end
