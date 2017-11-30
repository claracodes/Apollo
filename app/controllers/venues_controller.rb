class VenuesController < ApplicationController

  # before_action :host?

  def show
    @event_pages = true
    @venue = set_venue
    for_maps
    authorize @venue
  end

  def index
    @event_pages = true
  end

  def edit
    @event_pages = true
  end

  def upvote
    @venue = set_venue
    if current_user.voted_for? @venue
      @venue.unliked_by current_user
    else
      @venue.liked_by current_user
    end
    authorize @venue
    respond_to do |format|
      format.html { redirect_to "/" }
      format.js # upvote.js.erb
    end
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def for_maps
    @hash = Gmaps4rails.build_markers(@venue) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.json({ :id => venue.id })
      marker.picture({url: fetch_moods(venue), width: 32, height: 32})
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end
  end

  def fetch_moods(venue)
    # added if/else cause sometimes venue/event don't have moods so it crashes
    if venue.events.first && venue.events.first.try(:mood)
      "/assets/icons-apollo-black-#{venue.events.first.mood}.png"
    else
      "/assets/icons-apollo-black-Dramatic.png"
    end
  end

  def host?
    @user.host
  end
end
