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
    @bookings = []
    Booking.all.each do |booking|
      if current_user.id == booking.user.id
        @bookings << booking
      end
    end
  end

  private
end


