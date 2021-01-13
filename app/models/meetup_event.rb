class MeetupEvent
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

  def event_data
    @_event_data ||= HTTParty
      .get("https://api.meetup.com/NewYorkAdventureClub/events")
      .first
  end
end
