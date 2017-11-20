class PagesController < ApplicationController
  def home
    @events = Event.all
  end
end
