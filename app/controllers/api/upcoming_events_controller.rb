module Api
  class UpcomingEventsController < ApplicationController
    def index
      render json: event_data
    end

    private

    def event_data
      HTTParty
        .get("https://api.meetup.com/NewYorkAdventureClub/events")
        .first
    end
  end
end
