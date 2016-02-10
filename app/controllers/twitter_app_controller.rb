class TwitterAppController < ApplicationController


before_action :authenticate_user!

include TwitterAppHelper

def new

	if current_user.providers.where(provider: 'twitter').any?
		render 'followed'
	else
		redirect_to '/auth/twitter'
	end

end

def create


	@twitter_data = request.env['omniauth.auth']
	Provider.create_or_find( request.env['omniauth.auth'], current_user)
	redirect_to twitterfollowed_path
	
end

def followed

	@friends = twitter_pass.friends( { :count => 5 } )
	
end

def show

	@last_tweets = twitter_feed("#{params[:screen_name]}")
end

def search

	if params[:search].present? 
      if params[:times].nil? 
      params[:times] = 0
      end
	end
end
	


end
