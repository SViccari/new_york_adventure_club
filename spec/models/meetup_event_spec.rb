require "rails_helper"

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the event name" do
      allow(HTTParty)
        .to receive(:get)
        .and_return([{ "name" => "RSpec Training" }])

      meetup_event = MeetupEvent.new

      expect(meetup_event.name).to eq("RSpec Training")
    end
  end

  describe "#venue" do
    it "returns the event venue" do
      allow(HTTParty)
        .to receive(:get)
        .and_return([{ "venue" => { "name" => "Mars" }}])

      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Mars")
    end
  end

  describe "#local_date" do
    it "returns the event date" do
      allow(HTTParty)
        .to receive(:get)
        .and_return([{ "local_date" => "2000-01-13" }])

      meetup_event = MeetupEvent.new

      expect(meetup_event.local_date).to eq("2000-01-13")
    end
  end

  it "only issues the API call once" do
    allow(HTTParty)
      .to receive(:get)
      .and_return([{"name" => "RSpec Training"}])

    meetup_event = MeetupEvent.new
    meetup_event.name
    meetup_event.name

    expect(HTTParty).to have_received(:get).once
  end
end
