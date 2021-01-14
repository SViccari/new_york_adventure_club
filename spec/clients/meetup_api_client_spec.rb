require "rails_helper"

RSpec.describe MeetupApiClient do
  describe "#next_event" do
    it "returns the next event" do
      event_double = double("event 1")
      other_event_double = double("event 2")

      expect(HTTParty)
        .to receive(:get)
        .with("https://api.meetup.com/NewYorkAdventureClub/events")
        .and_return([event_double, other_event_double])

      event = MeetupApiClient.new.next_event

      expect(event).to eq(event_double)
    end
  end
end
