class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.last(3)
  end
end
