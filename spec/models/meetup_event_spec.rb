require "rails_helper"

RSpec.describe MeetupEvent do
  let(:meetup_api_client) do
    instance_double(MeetupApiClient, next_event: next_event_data)
  end

  describe "#name" do
    let(:next_event_data) do
      { "name" => "RSpec Training" }
    end

    it "returns the event name" do
      allow(MeetupApiClient)
        .to receive(:new)
        .and_return(meetup_api_client)

      meetup_event = MeetupEvent.new

      expect(meetup_event.name).to eq("RSpec Training")
    end
  end

  describe "#venue" do
    it "returns the event venue" do
      event_data = { "venue" => { "name" => "Mars" } }
      stub_meetup_api(event_data)

      meetup_event = MeetupEvent.new

      expect(meetup_event.venue).to eq("Mars")
    end
  end

  describe "#local_date" do
    it "returns the event date" do
      meetup_api_client = instance_double(
        MeetupApiClient,
        next_event: { "local_date" => "2000-01-13" }
      )

      allow(MeetupApiClient)
        .to receive(:new)
        .and_return(meetup_api_client)

      meetup_event = MeetupEvent.new

      expect(meetup_event.local_date).to eq("2000-01-13")
    end
  end

  it "only issues the API call once" do
    meetup_api_client = instance_double(
      MeetupApiClient,
      next_event: { "name" => "" }
    )

    allow(MeetupApiClient)
      .to receive(:new)
      .and_return(meetup_api_client)

    meetup_event = MeetupEvent.new
    meetup_event.name
    meetup_event.name

    expect(MeetupApiClient).to have_received(:new).once
  end

  def stub_meetup_api(data)
    instance_double(MeetupApiClient, next_event: data).tap do |double|
      allow(MeetupApiClient).to receive(:new).and_return(double)
    end
  end
end
