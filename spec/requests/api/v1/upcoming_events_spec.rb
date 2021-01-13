require "rails_helper"

RSpec.describe "GET /api/v1/upcoming_events" do
  it "returns the next upcoming event" do
    get "/api/v1/upcoming_events"

    expect(response).to be_successful
  end
end
