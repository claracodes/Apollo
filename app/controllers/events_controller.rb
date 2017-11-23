class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

  def show
    @event = Event.find(params[:id])
    @venues = Venue.find(@event.venue_id)
    for_maps
  end

  def search
    @events = Event.where(city: event_params[:city], category: event_params[:category] )
        # date: event_params[:date]
        # third search condition - but we have to have real good seeds for that! :)
    @venues = Venue.where.not(latitude: nil, longitude: nil)
    for_maps
  end

  def hostdashboard
    @venues = current_user.venues
  end

  private

  def host?
    current_user.host
  end

  def event_params
    params.require(:event).permit(:date, :city, :category)
  end

  def for_maps
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end
  end
end
