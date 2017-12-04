class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.last(3)
    @activities = policy_scope(PublicActivity::Activity).order('created_at desc').where(trackable_type: "Booking").where(owner_id: current_user.friends_ids, owner_type:"User") #

    @venues = []
    current_user.find_voted_items.each do |item|
      @venues << item if item.class == Venue
    end

    @bookmarks = []
    current_user.find_voted_items.each do |item|
      @bookmarks << item if item.class == Event
    end

    #@upvoted = Event.where('get_upvotes').count().oder(:desc)

    # @bookmarked = {}
    # current_user.friends.each do |friend|
    #   bookmarked_events = []
    #   friend.find_voted_items.each do |item|
    #     bookmarked_events << item if item.class == Event
    #   end
    #   @bookmarked = {"#{friend.first_name}": bookmarked_events}
    # end
  end
end
