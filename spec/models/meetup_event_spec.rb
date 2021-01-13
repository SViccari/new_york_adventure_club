require "rails_helper"

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the name" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.name).to match("'The Great Murals of New York City")
    end
  end

  describe "#venue" do
    it "returns the venue name" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Online event")
    end
  end

  describe "#date" do
    it "returns the event date" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.date).to eq("2021-01-13")
    end
  end
end
