class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :account
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
