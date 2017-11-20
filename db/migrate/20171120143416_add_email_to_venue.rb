class AddEmailToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :email, :string
  end
end
