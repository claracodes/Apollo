class AddEndTimeToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :end_time, :date
  end
end
