class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def search
    @events = []
    Event.all.each do |event|
      if event.category == event_params[:category]
        #&& event.date == event_params[:date]
        #&& event.city == event_params[:city]
        @events << event
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :city, :category)
  end

end
