class PaymentsController < ApplicationController
  before_action :set_booking

  def new
    #...
  end

  def create
    # ...
    redirect_to @booking
  end

private

  def set_booking
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
    authorize @booking
  end
end
