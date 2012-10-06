class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.string :title
      t.text :rules

      t.timestamps
    end
  end
end
