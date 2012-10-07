class CreateContestantAssignments < ActiveRecord::Migration
  def change
    create_table :contestant_assignments do |t|
      t.integer :contestant_id
      t.integer :duel_id

      t.timestamps
    end
  end
end
