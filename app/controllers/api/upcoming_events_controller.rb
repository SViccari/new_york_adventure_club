module Api
  class UpcomingEventsController < ApplicationController
    def index
      render json: {
        name: event_data["name"],
        venue: event_data.dig("venue", "name"),
        local_date: event_data["local_date"]
      }
    end

    private

    def event_data
      HTTParty
        .get("https://api.meetup.com/NewYorkAdventureClub/events")
        .first
    end
  end
end
