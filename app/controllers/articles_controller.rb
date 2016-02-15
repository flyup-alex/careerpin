class ArticlesController < ApplicationController
 
include FacebookAppHelper
include TwitterAppHelper
include InstagramAppHelper

  def index

    @articles = Article.where(:user_id => params[:id]).limit(32).order(time: :desc)
  end

  def create_fb
    Article.where(provider: "facebook").each do |art|
      art.destroy
    end
  	@feed = get_wall(current_user, params[:id])
  	Article.create_careerpin_fb(@feed, current_user, "facebook" )
  	redirect_to root_path

  end

  def create_twt
    Article.where(provider: "twitter").each do |art|
      art.destroy
    end
    @tweets = twitter_feed(params[:profile_name])
    Article.create_careerpin_twt(@tweets, current_user, "twitter")
    redirect_to root_path
  	
  end

  def create_inst
    Article.where(provider: "instagram").each do |art|
      art.destroy
    end
    instagram_pass
    @instagram = Instagram.user_recent_media("#{params[:user_id]}", {:count => 40})
    Article.create_careerpin_inst(@instagram, current_user, "instagram")
    redirect_to root_path
    
  end

  def destroy
  end
end
