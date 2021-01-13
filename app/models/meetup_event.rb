class MeetupEvent
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

  def events_data
    @_events_data ||= HTTParty
      .get("https://api.meetup.com/NewYorkAdventureClub/events")
      .first
  end
end
