class MigratePhotoOrderData < ActiveRecord::Migration
  def up
    Duel.all.each do |duel|
      duel.contestant_assignments.each do |assignment|
        assignment.photos.each_with_index do |photo, index|
          photo.update_attribute(:order, index+1)
        end
      end
    end
  end

  def down
    Duel.all.each do |duel|
      duel.contestant_assignments.each do |assignment|
        assignment.photos.each do |photo|
          photo.update_attribute(:order, nil)
        end
      end
    end
  end
end
