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
