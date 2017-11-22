class VenuesController < ApplicationController

  before_action :host?

  def index
  end

  def edit
  end

  private

  def host?
    @user.host
  end
end
