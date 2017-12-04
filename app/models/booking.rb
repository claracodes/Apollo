class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  monetize :amount_cents

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

end
