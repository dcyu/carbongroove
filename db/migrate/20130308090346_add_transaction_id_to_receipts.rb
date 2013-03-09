class AddTransactionIdToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :transaction_id, :integer
  end
end
