class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

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


  def hostdashboard
    @venues = current_user.venues
  end

  private

  def host?
    current_user.host
  end

  private

  def event_params
    params.require(:event).permit(:date, :city, :category)
  end


end
