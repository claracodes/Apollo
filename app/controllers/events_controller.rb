class EventsController < ApplicationController

 before_action :host?, only: [:hostdashboard, :edit, :delete, :create]

 def show
  @event = Event.find(params[:id])
 end

  def index

    @query = params[:search]
    if params[:search]
      @events = Event.all
      @events = @events.where(city: params[:search][:city].capitalize) if params[:search][:city].present?
      @events = @events.where(category: params[:search][:category]) if params[:search][:category].present?
      @events = @events.where(date: params[:search][:date].to_date) if params[:search][:date].present?
      @events = @events.where("events.price <= ?", params[:search][:price].to_i) if params[:search][:price].present?
      @events = @events.where(tag: params[:search][:tag]) if params[:search][:tag].present?
      @events = @events.where(english: params[:search][:english]) if params[:search][:english].present?
      #raise
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

  # def search
  #   params[:search] ||= {}
  #   @events = Event.all
  #   # or params[:search].each.... don't forget to change form to simple_form_for :search
  #   [:category, :city, :date].each do |query|
  #     @events = @events.where(query => params[:search][query].downcase) unless params[:search][query]
  #   end
  # end

  ############## TEST FOR THE RESULTS PAGE ###################
  # def filter
  #   @events = Event.filter(event_params)
  # end
  ############################################################

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
end
