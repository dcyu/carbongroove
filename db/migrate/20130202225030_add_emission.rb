class AddEmission < ActiveRecord::Migration
  def change
    add_column :receipts, :emission, :string
  end
end