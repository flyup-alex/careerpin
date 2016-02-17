class ArticlesController < ApplicationController
 
include FacebookAppHelper
include TwitterAppHelper
include InstagramAppHelper

  def index

    @articles = Article.where(:user_id => params[:id]).limit(20).order(time: :desc)
    
  end

  def create

    @article = Article.new(super_params)
    if @article.save
      redirect_to article_path(current_user.id)
    else
      redirect to root_path
    end
    
  end

  def create_fb
  	@feed = get_wall(current_user, params[:id])
  	Article.create_careerpin_fb(@feed, current_user, "facebook" )
  	redirect_to article_path(current_user.id)

  end

  def create_twt
    #Article.where(provider: "twitter").each do |art|
    #  art.destroy
    #end
    @tweets = twitter_feed(params[:profile_name])
    Article.create_careerpin_twt(@tweets, current_user, "twitter")
    redirect_to article_path(current_user.id)
  	
  end

  def create_inst
    instagram_pass
    @instagram = Instagram.user_recent_media("#{params[:user_id]}", {:count => 40})
    Article.create_careerpin_inst(@instagram, current_user, "instagram")
    redirect_to article_path(current_user.id)
    
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to article_path(current_user.id)
  end

private
  
  def super_params
    
    params.require(:article).permit(:title, :text, :time, :photo_url, :provider, :link, :author, :user_id)

  end
  

end
