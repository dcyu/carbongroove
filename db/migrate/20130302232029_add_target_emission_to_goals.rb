class AddTargetEmissionToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :target_emission, :string, default: "0"
  end
end
