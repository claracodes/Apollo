class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.all
  end
end
