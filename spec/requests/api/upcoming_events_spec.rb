require "rails_helper"

RSpec.describe "GET /api/upcoming_events" do
  it "returns the next upcoming event" do
    allow(HTTParty).to receive(:get).and_call_original

    get "/api/upcoming_events"

    expect(response).to be_successful

    event = JSON.parse(response.body)

    expect(event["name"]).to match(/Exposing NYC's Gilded Age Elite Society/)
    expect(event["venue"]).to eq("Online event")
    expect(event["local_date"]).to eq("2021-01-13")

    expect(HTTParty).to have_received(:get).once
  end
end
