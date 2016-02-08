class CreateAmbasadors < ActiveRecord::Migration
  def change
    create_table :ambasadors do |t|
      t.string :provider
      t.datetime :last_seen
      t.string :object_id
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
