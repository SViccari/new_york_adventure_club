require "rails_helper"

RSpec.describe MeetupApiClient do
  describe "#next_event" do
    it "returns the next meetup event from the Meetup API" do
      event = double("event 1")
      other_event = double("event 2")

      allow(HTTParty).to receive(:get).and_return([event, other_event])

      next_event = MeetupApiClient.new.next_event

      expect(HTTParty)
        .to have_received(:get)
        .with("https://api.meetup.com/NewYorkAdventureClub/events")

      expect(next_event).to eq(event)
    end
  end
end
