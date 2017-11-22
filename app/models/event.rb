class Event < ApplicationRecord
  CATEGORY = ["theater", "exhibition", "museum", "movie", "cultural sight", "opera", "concert"]
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY,
              message: "%{value} is not a valid category" }
  # validates :start_time, presence: true
  # validates :duration, presence: true
  validates :date, presence: true
  validates :price, presence: true
  belongs_to :venue
  has_many :bookings
  mount_uploader :photo, PhotoUploader
end
