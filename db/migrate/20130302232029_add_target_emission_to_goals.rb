class AddTargetEmissionToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :target_emission, :string
  end
end
