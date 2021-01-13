require "rails_helper"

RSpec.describe "GET /api/upcoming_events" do
  it "returns the next upcoming event" do
    data = [
      {
        name: "RSpec Training",
        venue: { name: "Mars" },
        local_date: "2000-01-13"
      }
    ]
    stub_meetup_api_request(data)

    get "/api/upcoming_events"

    expect(response).to be_successful

    event = JSON.parse(response.body)

    expect(event["name"]).to eq("RSpec Training")
    expect(event["venue"]).to eq("Mars")
    expect(event["local_date"]).to eq("2000-01-13")
  end

  def stub_meetup_api_request(data)
    stub_request(
      :get,
      "https://api.meetup.com/NewYorkAdventureClub/events"
    ).to_return(
      status: 200,
      headers: { content_type: 'application/json' },
      body: data.to_json
    )
  end
end
