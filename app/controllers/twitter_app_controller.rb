class TwitterAppController < ApplicationController


before_action :authenticate_user!

include TwitterAppHelper

def new

	if current_user.providers.where(provider: 'twitter').any?
		redirect_to twitterfollowed_path
	else
		redirect_to '/auth/twitter'
	end

end

def create
	request.env['omniauth.auth']
	Provider.create_or_find( request.env['omniauth.auth'], current_user)
	@friendships = twitter_pass.friends
	TwitterFriend.create(@friendships, current_user)
	redirect_to twitterfollowed_path
	
end

def followed
	

	@friends = TwitterFriend.all	

end

def show
	@article = Article.new
	user_time = TwitterFriend.find_by( :friend_screen_name => "#{params[:screen_name]}")
	user_time.friend_last_status = Date.today - 30
	user_time.save
	@last_tweets = twitter_feed("#{params[:screen_name]}")

end

def search

	if params[:search].present? 
		link = params[:search]
		id = link.split("/").last
		@tweet = twitter_pass.statuses( id )
		@search = searching( id )
      if params[:times].nil? 
      params[:times] = 0
      end
	end
	
end
	


end
