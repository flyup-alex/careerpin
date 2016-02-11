class CreateTwitterFriends < ActiveRecord::Migration
  
  

  def change
    create_table :twitter_friends do |t|
      t.string :friend_name
      t.string :friend_screen_name
      t.string :friend_profile_picture
      t.string :friend_last_status
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
