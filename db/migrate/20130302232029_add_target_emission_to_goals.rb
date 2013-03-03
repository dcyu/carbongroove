class AddTargetEmissionToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :target_emission, :integer, default: 0
  end
end
