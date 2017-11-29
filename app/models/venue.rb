class Venue < ApplicationRecord
  validates :name, presence: true
#  validates :description, presence: true
  # validates :phone, presence: true
#  validates :email, presence: true

  mount_uploader :photo, PhotoUploader

  has_many :events

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
