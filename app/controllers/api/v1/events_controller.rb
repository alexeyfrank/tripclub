class Api::V1::EventsController < Api::V1::ApplicationController
  def index
    @events = Event.all
    # respond_with @events
  end
end
