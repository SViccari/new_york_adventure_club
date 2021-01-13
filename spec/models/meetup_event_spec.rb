require "rails_helper"

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the event name" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.name)
        .to match(/Exposing NYC's Gilded Age Elite Society/)
    end
  end

  describe "#venue" do
    it "returns the event venue" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Online event")
    end
  end

  describe "#local_date" do
    it "returns the event date" do
      meetup_event = MeetupEvent.new

      expect(meetup_event.local_date).to eq("2021-01-13")
    end
  end
end
