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
      @events = @events.where(date: @query[:date].to_date) if @query[:date].present?
      @events = @events.where(category: @query[:category]) if @query[:category].present?
      @events = @events.where("events.price <= ?", @query[:price].to_i) if @query[:price].present?
      # @events = @events.where(tag: @query[:tag]) if @query[:tag].present?
      @events = @events.where(mood: @query[:mood]) if @query[:mood].present?
      # @events = @events.where(english: @query[:english]) if @query[:english].present?
    else
      @events = policy_scope(Event)
    end
    @venues = Venue.where(id: @events.map(&:venue_id))
    for_maps
  end

  def upvote
    @event = set_event
    if current_user.voted_for? @event
      @event.unliked_by current_user
    else
      @event.liked_by current_user
    end
    authorize @event
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js # upvote.js.erb
    end
  end

  def downvote
    @event = set_event
    @event.unliked_by current_user
    authorize @event
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js # downvote.js.erb
    end
  end

  private

  # def host?
  #   current_user.host
  # end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :city, :category)
  end

  def for_maps
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.json({ :id => venue.id })
      marker.picture({url: fetch_moods(venue), width: 32, height: 32})
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end
  end

  def fetch_moods(venue)
    "/assets/icons-apollo-black-#{venue.events.first.mood}.png"
  end


  # def custom_marker
  #   @events.each do |event|
  #     if event.mood == "Wild"
  #       puts 'https://image.ibb.co/hUDz06/icons_apollo_black_07.png'
  #     elsif event.mood == "Romantic"
  #       puts 'https://image.ibb.co/cEtcnm/icons_apollo_black_08.png'
  #     elsif event.mood == "Glamorous"
  #       puts 'https://image.ibb.co/jp5ZYR/icons_apollo_black_11.png'
  #     elsif event.mood == "Nerdy"
  #       puts 'https://image.ibb.co/dyFe06/icons_apollo_black_10.png'
  #     elsif event.mood == "Dramatic"
  #       puts 'https://image.ibb.co/bMB2L6/icons_apollo_black_09.png'
  #     end
  #   end
  # end

end
