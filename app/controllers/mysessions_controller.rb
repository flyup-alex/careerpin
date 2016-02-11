class MysessionsController < Devise::SessionsController

prepend_before_action :delete_providers, :delete_twitter_friends, only: :destroy

	def delete_providers
		current_user.providers.all.each do |prov|
			prov.destroy
		end
	end

	def delete_twitter_friends
			current_user.twitter_friends.all.each do |friend|
				friend.destroy
		end
	end
end
