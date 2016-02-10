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
	@tweet = Twitter::REST::Client.new do |config|
        config.consumer_key        = "LG74yEHe81rppMoq665Fbee8S"
        config.consumer_secret     = "theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H"
        config.access_token        = "#{current_user.providers.where(provider: "twitter").first.token1}"
        config.access_token_secret = "#{current_user.providers.where(provider: "twitter").first.token2}"
	@tweet.friends( { :count => 5 } )
	
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
