class TwitterAppController < ApplicationController
before_action :authenticate_user!

def new
	if current_user.providers.where(provider: 'twitter').any?
		redirect_to '/twitterfollowed'
	else
		redirect_to '/auth/twitter'
	end

end

def create

	@twitter_data = request.env['omniauth.auth']
	Provider.create_or_find( request.env['omniauth.auth'], current_user)
	#redirect_to twitterfollowed_path
	
	
end


def followed


	
end

end
