class AddCityToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :city, :string
  end
end
