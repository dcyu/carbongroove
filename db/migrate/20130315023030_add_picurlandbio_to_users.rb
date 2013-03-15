class AddPicurlandbioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pic_url, :string
    add_column :users, :bio, :string
  end
end
