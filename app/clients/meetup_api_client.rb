class MeetupApiClient
  def next_event
    HTTParty
      .get("https://api.meetup.com/NewYorkAdventureClub/events")
      .first
  end
end
