class Event < ApplicationRecord
  CATEGORY = ["theater", "exhibition", "movie", "cultural sight", "museum", "opera", "concert"]
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY,
              message: "%{value} is not a valid category" }
  # validates :start_time, presence: true
  # validates :duration, presence: true
  validates :date, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :venue
end
