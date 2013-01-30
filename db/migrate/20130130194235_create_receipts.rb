class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :type
      t.integer :cost
      t.datetime :date
      t.timestamps
    end
  end
end
