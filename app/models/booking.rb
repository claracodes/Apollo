class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  monetize :amount_cents

  include PublicActivity::Model
  tracked
end
