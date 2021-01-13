require "rails_helper"

RSpec.describe "GET /api/v1/upcoming_events" do
  it "returns the next upcoming event" do
    get "/api/v1/upcoming_events"

    event = JSON.parse(response.body)

    expect(response).to be_successful

    expect(event["name"]).to eq("'The Great Murals of New York City' Webinar")
    expect(event["venue"]["name"]).to eq("Online event")
    expect(event["local_date"]).to eq("2021-01-13")
  end
end
