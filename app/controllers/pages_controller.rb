class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.first(5)
    @venues = Venue.first(3)

    if user_signed_in?
      @activities = policy_scope(PublicActivity::Activity).order('created_at desc').where(trackable_type: "Booking").where(owner_id: current_user.friends_ids, owner_type:"User") #
      @liked_venues = []
      current_user.find_voted_items.each do |item|
        @liked_venues << item if item.class == Venue
      end

      @bookmarks = []
      current_user.find_voted_items.each do |item|
        @bookmarks << item if item.class == Event
      end
    end

    @most_liked = Event.order(cached_votes_total: :desc).limit(3)
  end
end
