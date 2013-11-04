# encoding: utf-8
class Web::EventsController < Web::ApplicationController

  layout 'web/events'

  def index
  end

  def show
    @event = Event.find params[:id]
  end

  private
    def title
      'Календарь событий'
    end
end

