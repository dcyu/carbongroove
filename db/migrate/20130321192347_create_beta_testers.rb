class CreateBetaTesters < ActiveRecord::Migration
  def change
    create_table :beta_testers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
