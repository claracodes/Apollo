class PagesController < ApplicationController
  def home
    @events = Events.all
  end
end
