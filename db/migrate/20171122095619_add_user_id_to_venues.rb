class AddUserIdToVenues < ActiveRecord::Migration[5.0]
  def change
    add_reference :venues, :user, foreign_key: true
  end
end
