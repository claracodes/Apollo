class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.text :description
      t.date :opening_hours

      t.timestamps
    end
  end
end
