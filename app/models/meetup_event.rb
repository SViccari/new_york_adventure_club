class MeetupEvent
  def initialize(data_source: MeetupApiClient.new)
    @data_source = data_source
  end

  def name
    event_data["name"]
  end

  def venue
    event_data.dig("venue", "name")
  end

  def local_date
    event_data["local_date"]
  end

  private
  attr_reader :data_source

  def event_data
    @_event_data ||= data_source.next_event
  end
end
