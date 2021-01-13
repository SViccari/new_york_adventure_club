class MeetupEvent
  def initialize(data_source: MeetupApiClient.new)
    @data_source = data_source
  end

  def name
    events_data["name"]
  end

  def venue
    events_data["venue"]["name"]
  end

  def date
    events_data["local_date"]
  end

  private
  attr_reader :data_source

  def events_data
    @_events_data ||= data_source.next_event
  end
end
