module Api
  class UpcomingEventsController < ApplicationController
    def index
      meetup_event = MeetupEvent.new

      render json: {
        name: meetup_event.name,
        venue: meetup_event.venue,
        local_date: meetup_event.local_date
      }
    end
  end
end
