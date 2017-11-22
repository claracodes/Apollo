class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

 def show
  @event = Event.find(params[:id])
 end

  def search
    # To be changed to add city, category and date and create view
    @events = Event.find_by(params[:city])
  end

  def hostdashboard
    @venues = current_user.venues
  end

  private

  def host?
    current_user.host
  end
end
