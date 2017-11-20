class AddCityToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :city, :string
  end
end
