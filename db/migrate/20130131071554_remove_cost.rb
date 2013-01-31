class RemoveCost < ActiveRecord::Migration
  remove_column :receipts, :cost
  add_column :receipts, :cost, :string
end
