class AddUser < ActiveRecord::Migration
  def change
    add_column :receipts, :user_id, :integer
  end
end
