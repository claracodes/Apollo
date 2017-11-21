class AddPhotoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :photo, :string
  end
end
