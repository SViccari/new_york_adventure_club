# Feature Goal: Next Upcoming Event, name, venue, date

require "rails_helper"

RSpec.describe "GET /api/upcoming_events" do
  it "returns the next upcoming event" do
    get "/api/upcoming_events"

    expect(response).to be_successful
  end
end
