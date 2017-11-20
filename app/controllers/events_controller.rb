class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def search
    # To be changed to add city, category and date and create view
    @events = Event.find_by(params[:city])
  end
end
