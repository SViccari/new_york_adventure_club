require "rails_helper"

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the name" do
      event_data = { "name" => "Foosball Game" }
      meetup_api_client_double = instance_double(
        MeetupApiClient,
        next_event: event_data
      )

      expect(MeetupApiClient)
        .to receive(:new)
        .and_return(meetup_api_client_double)

      meetup_event = MeetupEvent.new

      expect(meetup_event.name).to eq("Foosball Game")
    end
  end

  describe "#venue" do
    it "returns the venue name" do
      event_data = { "venue" => { "name" => "Basement" } }
      meetup_api_client_double = instance_double(
        MeetupApiClient,
        next_event: event_data
      )

      expect(MeetupApiClient)
        .to receive(:new)
        .and_return(meetup_api_client_double)

      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Basement")
    end
  end

  describe "#date" do
    it "returns the event date" do
      event_data = { "local_date" => "2021-01-15" }

      meetup_api_client_double = instance_double(
        MeetupApiClient,
        next_event: event_data
      )

      expect(MeetupApiClient)
        .to receive(:new)
        .and_return(meetup_api_client_double)

      meetup_event = MeetupEvent.new

      expect(meetup_event.date).to eq("2021-01-15")
    end
  end
end
