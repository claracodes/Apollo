class PagesController < ApplicationController

  def home
    @event = Event.new
    @events = Event.last(3)
    @activities = policy_scope(PublicActivity::Activity).order('created_at desc').where(trackable_type: "Booking").limit(3) #.where(owner: current_user.all_following, owner_type:"User")
  end
end
