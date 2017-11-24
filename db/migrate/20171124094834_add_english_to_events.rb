class AddEnglishToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :english, :boolean
  end
end
