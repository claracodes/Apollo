class BookingsController < ApplicationController

  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = Booking.new
    @booking.event = @event
    @booking.user = current_user

    if @booking.save
      redirect_to @booking
    else
      flash[:notice] = "Sorry, try again!"
      redirect_to @event
    end
    authorize @booking
  end

  def show
    @booking = Booking.includes(:event).find(params[:id])
    authorize @booking
  end

  def index
    #please leave theses comments for now - i want to do some research on it :) Clara
    # @bookings = []
    # Booking.all.each do |booking|
    #   if current_user.id == booking.user.id
    #     @bookings << booking
    #   end
    # end

    # where(column: value)
    # where("column = ?")
    # Arel

    #@bookings = current_user.bookings
    @bookings = policy_scope(Booking).order(created_at: :desc)

    @venues = Event.where(id: @bookings.pluck(:event_id)).map(&:venue)
    @hash = Gmaps4rails.build_markers(@venues) do |venue, marker|
      marker.lat venue.latitude
      marker.lng venue.longitude
      marker.picture({url: 'https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/location-alt-32.png', width: 32, height: 32})
      marker.infowindow render_to_string(partial: "/venues/map_box", locals: { venue: venue })
    end

    #authorize @booking
  end
end


