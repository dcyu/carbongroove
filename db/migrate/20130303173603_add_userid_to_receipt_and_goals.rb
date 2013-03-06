class AddUseridToReceiptAndGoals < ActiveRecord::Migration
  def change
    add_column :receipts, :interval_id, :integer
    add_column :goals, :interval_id, :integer


  end
end
