class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.first(3)
  end
end
