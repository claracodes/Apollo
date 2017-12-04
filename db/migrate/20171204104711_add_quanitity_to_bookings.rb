class AddQuanitityToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :quantity, :integer
  end
end
