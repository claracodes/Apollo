class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  monetize :amount_cents

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy

  scope :paid, -> { where(state: "paid") } # could be used to only show paid/pending bookings in the view. in the controller just add
  scope :pending, -> { where(state: "pending") } #.paid or .pending to the @bookings = Booking.where(...).paid
end
