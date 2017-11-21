class AddPhotoToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :photo, :string
  end
end
