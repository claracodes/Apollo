class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

 def show
  @event = Event.find(params[:id])
 end

  def index
    if params[:search]
      @events = Event.all
      # binding.pry
      @events = @events.where(city: params[:search][:city].capitalize) if params[:search][:city].present?
      @events = @events.where(category: params[:search][:category]) if params[:search][:category].present?
    else
      @events = Event.all
    end

    @venues = Venue.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
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
