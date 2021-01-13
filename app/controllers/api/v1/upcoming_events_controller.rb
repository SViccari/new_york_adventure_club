module Api
  module V1
    class UpcomingEventsController < ApplicationController
      def index
        render json: {
          event_name: events_data["name"],
          event_venue: events_data["venue"]["name"],
          event_date: events_data["local_date"]
        }
      end

      private

      def events_data
        HTTParty
          .get("https://api.meetup.com/NewYorkAdventureClub/events")
          .first
      end
    end
  end
end
