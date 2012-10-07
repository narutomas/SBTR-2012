class AddNumberOfPhotosPerContestantToDuels < ActiveRecord::Migration
  def change
    add_column :duels, :number_of_photos_per_contestant, :integer
  end
end
