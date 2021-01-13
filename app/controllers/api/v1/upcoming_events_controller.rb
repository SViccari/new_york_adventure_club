module Api
  module V1
    class UpcomingEventsController < ApplicationController
      def index
        render json: events_data
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
