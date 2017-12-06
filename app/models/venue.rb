class Venue < ApplicationRecord
  validates :name, presence: true
#  validates :description, presence: true
  # validates :phone, presence: true
#  validates :email, presence: true

  mount_uploader :photo, PhotoUploader

  has_many :events

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # For the bookmark feature:
  acts_as_votable

  include AlgoliaSearch
  algoliasearch auto_index: true, auto_remove: true do
    attribute :name, :city
    searchableAttributes ['name', 'city']

    add_index "dev_event_and_venue", id: :algolia_id do
      attribute :name, :city
      searchableAttributes [:name, :city]

      attribute :type do
        "Venue"
      end
    end
  end

  private

  def algolia_id
    "venue_#{id}"
  end
end

