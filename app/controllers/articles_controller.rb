class ArticlesController < ApplicationController
 
include FacebookAppHelper
include TwitterAppHelper

  def index
  end

  def create_fb

  	@feed = get_wall(current_user, params[:id])
  	Article.create_careerpin_fb(@feed, current_user, "facebook" )
  	redirect_to root_path

  end

  def create_twt

    @tweets = twitter_feed(params[:screen_name])
    Article.create_careerpin_twt(@tweets, current_user, "twitter")
    redirect_to root_path
  	
  end

  def destroy
  end
end
