class TwitterAppController < ApplicationController


before_action :authenticate_user!

include TwitterAppHelper

def new

	if current_user.providers.where(provider: 'twitter').any?
		current_user.providers.where(provider: 'twitter').first.destroy
		redirect_to '/auth/twitter'
	end

end

def create


	@twitter_data = request.env['omniauth.auth']
	Provider.create_or_find( request.env['omniauth.auth'], current_user)
	redirect_to twitterfollowed_path
	


def followed

	@friends = twitter_pass.friends
	
end

def show

	@last_tweets = twitter_feed("#{params[:screen_name]}")
end

	
end

private
	
	def kosmos


	end
end
