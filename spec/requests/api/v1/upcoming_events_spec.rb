require "rails_helper"

RSpec.describe "GET /api/v1/upcoming_events" do
  it "returns the next upcoming event" do
    get "/api/v1/upcoming_events"

    event = JSON.parse(response.body)

    expect(response).to be_successful

    expect(event["event_name"]).to match("'The Great Murals of New York City")
    expect(event["event_venue"]).to eq("Online event")
    expect(event["event_date"]).to eq("2021-01-13")
  end
end
