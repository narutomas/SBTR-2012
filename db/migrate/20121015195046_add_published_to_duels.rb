class AddPublishedToDuels < ActiveRecord::Migration
  def change
    add_column :duels, :published, :boolean, :default => false
  end
end
