module Api
  module V1
    class UpcomingEventsController < ApplicationController
      def index
        meetup_event = MeetupEvent.new

        render json: {
          event_name: meetup_event.name,
          event_venue: meetup_event.venue,
          event_date: meetup_event.date
        }
      end
    end
  end
end
