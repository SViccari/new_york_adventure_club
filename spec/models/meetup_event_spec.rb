require "rails_helper"

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the name" do
      event_data = [ { "name" => "Foosball Game" } ]
      expect(HTTParty).to receive(:get).and_return(event_data)

      meetup_event = MeetupEvent.new

      expect(meetup_event.name).to eq("Foosball Game")
    end
  end

  describe "#venue" do
    it "returns the venue name" do
      event_data = [ { "venue" => { "name" => "Basement" } } ]
      expect(HTTParty).to receive(:get).and_return(event_data)

      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Basement")
    end
  end

  describe "#date" do
    it "returns the event date" do
      event_data = [ { "local_date" => "2021-01-15" } ]
      expect(HTTParty).to receive(:get).and_return(event_data)

      meetup_event = MeetupEvent.new

      expect(meetup_event.date).to eq("2021-01-15")
    end
  end
end
