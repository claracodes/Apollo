class VenuesController < ApplicationController

  # before_action :host?

  def show
    @venue_pages = true
    @venue = Venue.find(params[:id])
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

  def host?
    @user.host
  end
end
