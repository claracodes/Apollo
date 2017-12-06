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
  validates :price_cents, presence: true
  validates :mood, presence: true, inclusion: { in: MOOD,
              message: "%{value} is not a valid mood" }

  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :venue

  # For monetize feature
  monetize :price_cents

  # For the bookmark feature:
  acts_as_votable

  include AlgoliaSearch
  algoliasearch auto_index: true, auto_remove: true do
    attribute :name, :category
    searchableAttributes ['name', 'category']

    add_index "dev_event_and_venue", id: :algolia_id do
      attribute :name, :category
      searchableAttributes [:name, :category]

      attribute :type do
        "Event"
      end
    end
  end

  private

  def algolia_id
    "event_#{id}"
  end
end
