class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.datetime :time
      t.string :photo_url
      t.string :provider
      t.string :link
      t.string :author
      t.integer :user_id
      

      t.timestamps null: false
    end
  end
end
