class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  attr_reader :last_name

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  has_many :events, through: :bookings
  has_many :bookings
  has_many :venues #for the hosts

  # For the bookmark feature:
  acts_as_voter

  def friends
    if uid
      graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
      friends = graph.get_connections(uid, "friends") || []
      users = friends.map do |friend|
        User.find_by(uid: friend['id'])
      end
      users.compact
    else
      []
    end
  end

  def friends_ids
    if uid
      friends.map(&:id)
    else
      []
    end
  end
end
