class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

  def show
    @event_pages = true
    @event = Event.find(params[:id])
    @venues = Venue.find(@event.venue_id)
    for_maps
    authorize @event
  end

  def index
    @event_pages = true

    # @query = params[:search]
    session[:search_query] = params[:search] || params
    @query = session[:search_query]
    if params[:search]
      @events = policy_scope(Event)
      @events = @events.where(city: @query[:city].capitalize) if @query[:city].present?
      @events = @events.where(category: @query[:category]) if @query[:category].present?
      @events = @events.where(date: @query[:date].to_date) if @query[:date].present?
      @events = @events.where("events.price <= ?", @query[:price].to_i) if @query[:price].present?
      @events = @events.where(tag: @query[:tag]) if @query[:tag].present?
      # @events = @events.where(english: @query[:english]) if @query[:english].present?
    else
      @events = Event.all
    end

    @venues = Venue.where(id: @events.map(&:venue_id))
    for_maps
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
      marker.picture({url: 'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/location-alt-32.png', width: 32, height: 32})
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end
  end
end
