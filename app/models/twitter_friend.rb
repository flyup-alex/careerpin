class TwitterFriend < ActiveRecord::Base

belongs_to :user

	def self.create(friends, current_user)
			friends.each do |friend|
			TwitterFriend.new do |twitter_friend|
			twitter_friend.friend_last_status = friend.status.created_at.to_time 
			twitter_friend.friend_name = friend.name
			twitter_friend.friend_profile_picture = friend.profile_image_url_https
			twitter_friend.friend_screen_name = friend.screen_name
			twitter_friend.user_id = current_user.id
			twitter_friend.save
			end 
		end   
    end



end
