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

  private

  def host?
    @user.host
  end
end
