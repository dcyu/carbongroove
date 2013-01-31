class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :type
      t.string :cost
      t.datetime :date
      t.timestamps
    end
  end
end
