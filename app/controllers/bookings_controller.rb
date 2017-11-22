class BookingsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

  def create
    @event = Booking.find_by(:event_id)
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @event
    else
      render "new"
    end
  end

  def show
  end

  def dashboard
    #please leave theses comments for now - i want to do some research on it :)
    # @bookings = []
    # Booking.all.each do |booking|
    #   if current_user.id == booking.user.id
    #     @bookings << booking
    #   end
    # end


    # where(column: value)
    # where("column = ?")
    # Arel

    @bookings = current_user.bookings

    @venues = Event.where(id: @bookings.map(&:event_id)).map(&:venue)
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      # marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end
  end

  private
end


