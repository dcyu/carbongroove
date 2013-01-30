class ChangeReceiptType < ActiveRecord::Migration
  def up
    rename_column :receipts, :type, :kind  
  end

  def down
  end
end
