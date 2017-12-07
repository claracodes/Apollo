class PaymentsController < ApplicationController
  before_action :set_booking

  def new

    @event = Event.find(params[:event_id])
    @booking = Booking.find(params[:booking_id])
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
      )

    charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @booking.amount_cents,
    description:  "Payment for #{@booking.id}",
    currency:     @booking.amount.currency
    )

    @booking.update(payment: charge.to_json, state: 'paid')
    redirect_to @booking
  end

private

  def set_booking
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
    authorize @booking
  end
end
