class AddHostToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :host, :boolean
  end
end
