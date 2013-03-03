class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.integer :goal_id
      t.integer :receipt_id

      t.timestamps
    end
  end
end
