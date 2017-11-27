class VenuesController < ApplicationController

  before_action :host?

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
