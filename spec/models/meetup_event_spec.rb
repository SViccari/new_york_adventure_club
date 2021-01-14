require "rails_helper"

# recommend moving this class to a shared location:
# spec/support/fake_clients/fake_meetup_api_client.rb
class FakeMeetupApiClient
  def initialize(event:)
    @event = event
  end

  def next_event
    @event
  end
end

RSpec.describe MeetupEvent do
  describe "#name" do
    it "returns the event name" do
      event_data = { "name" => "RSpec Training" }

      meetup_event = MeetupEvent.new(
        data_source: FakeMeetupApiClient.new(event: event_data)
      )

      expect(meetup_event.name).to eq("RSpec Training")
    end
  end

  describe "#venue" do
    it "returns the event venue" do
      event_data = { "venue" => { "name" => "Mars" } }

      meetup_event = MeetupEvent.new(
        data_source: FakeMeetupApiClient.new(event: event_data)
      )

      expect(meetup_event.venue).to eq("Mars")
    end
  end

  describe "#local_date" do
    it "returns the event date" do
      event_data = { "local_date" => "2000-01-13" }

      meetup_event = MeetupEvent.new(
        data_source: FakeMeetupApiClient.new(event: event_data)
      )

      expect(meetup_event.local_date).to eq("2000-01-13")
    end
  end

  it "only issues the API call once" do
    fake_meetup_api_client = spy("FakeMeetupApiClient")

    meetup_event = MeetupEvent.new(data_source: fake_meetup_api_client)

    meetup_event.name
    meetup_event.name

    expect(fake_meetup_api_client).to have_received(:next_event).once
  end
end
