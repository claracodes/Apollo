class CalendarController < ApplicationController

  def bookings
    @events = current_user.events
    respond_to do |format|
      format.html # bookings/index.html
      format.json { render "events/index.json.jbuilder" }
    end
  end
end

