‚class BookingsController < ApplicationController

  def new
  end

  def create
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
end


