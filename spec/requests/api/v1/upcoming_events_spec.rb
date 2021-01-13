require "rails_helper"

RSpec.describe "GET /api/v1/upcoming_events" do
  it "returns the next upcoming event" do
    event_data = [
      {
        name: "Foosball Game",
        venue: { name: "Basement" },
        local_date: "2021-01-15"
      }
    ]
    stub_meetup_request(event_data)

    get "/api/v1/upcoming_events"

    event = JSON.parse(response.body)

    expect(response).to be_successful

    expect(event["event_name"]).to eq("Foosball Game")
    expect(event["event_venue"]).to eq("Basement")
    expect(event["event_date"]).to eq("2021-01-15")
  end

  def stub_meetup_request(event_data)
    stub_request(
      :get,
      "https://api.meetup.com/NewYorkAdventureClub/events"
    ).to_return(
      status: 200,
      headers: { content_type: 'application/json'},
      body: event_data.to_json
    )
  end
end
