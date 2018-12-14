require "test_helper"

describe EventsController do
  let(:event) { events :one }

  it "gets index" do
    get events_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_event_url
    value(response).must_be :success?
  end

  it "creates event" do
    expect {
      post events_url, params: { event: { code: event.code, description: event.description, end: event.end, start: event.start, title: event.title } }
    }.must_change "Event.count"

    must_redirect_to event_path(Event.last)
  end

  it "shows event" do
    get event_url(event)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_event_url(event)
    value(response).must_be :success?
  end

  it "updates event" do
    patch event_url(event), params: { event: { code: event.code, description: event.description, end: event.end, start: event.start, title: event.title } }
    must_redirect_to event_path(event)
  end

  it "destroys event" do
    expect {
      delete event_url(event)
    }.must_change "Event.count", -1

    must_redirect_to events_path
  end
end
