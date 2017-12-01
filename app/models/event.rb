class Event < ApplicationRecord
  CATEGORY = ["theater", "exhibition", "movie", "concert"]
  MOOD = ["Dramatic", "Romantic", "Glamorous", "Wild", "Nerdy"]
  TAG = ["Dramatic", "Romantic", "Modern", "Funny"]
  validates :name, presence: true
#  validates :description, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY,
              message: "%{value} is not a valid category" }
  # validates :start_time, presence: true
  # validates :duration, presence: true
  validates :date, presence: true
  validates :price, presence: true
  validates :mood, presence: true, inclusion: { in: MOOD,
              message: "%{value} is not a valid mood" }

  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :venue

  # For monetize feature
  monetize :price_cents

  # For the bookmark feature:
  acts_as_votable
end
