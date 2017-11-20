class Venue < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end
