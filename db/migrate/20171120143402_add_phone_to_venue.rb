class AddPhoneToVenue < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :phone, :string
  end
end
