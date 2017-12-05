class AddCachedToEvents < ActiveRecord::Migration[4.2]
  def self.up
    add_column :events, :cached_votes_total, :integer, :default => 0
    add_index  :events, :cached_votes_total
  end
end
