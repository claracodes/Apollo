class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :tags
      t.integer :price
      t.date :start_time
      t.date :duration

      t.timestamps
    end
  end
end
