class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.string :total_emission
      t.datetime :start_range

      t.timestamps
    end
  end
end
