class AddDateToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :date, :date
  end
end
