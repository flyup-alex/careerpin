class ArticlesController < ApplicationController
 
include FacebookAppHelper
include TwitterAppHelper
include InstagramAppHelper

before_action :authenticate_user!, only: [:new, :create, :create_inst, :create_fb, :create_twt]

  def index

    @articles = Article.where(:user_id => params[:id]).limit(20).order(time: :desc)
    
  end

  def show

    @article = Article.find(params[:id])
    
  end

  def new

    @article = Article.new
    
  end

  def edit

    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])
    if @article.update(super_params)
      flash[:success] = "Pomyślnie zaktualizowano Pin."
      redirect_to own_article_path(@article)
    else
      flash[:success] = "Coś poszło nie tak. Spróbuj ponownie. Ładnie dzisiaj wyglądasz :)"
      redirect_to root_path
    end

    
  end

  def create

    @article = Article.new(super_params)
    if @article.save 
      if @article.provider == "own"
      @article.link = "/own_article/#{@article.id}"
      @article.save
      flash[:success] = "Pin został pomyślnie dodany do Career-Pin."
      redirect_to own_article_path(@article)

      else
      flash[:success] = "Pin został pomyślnie dodany do Career-Pin."
      redirect_to article_path(current_user.id)
    end
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
    flash[:danger] = "Pin został pomyślnie usunięty z Career-Pin."
    redirect_to article_path(current_user.id )
  end

private
  
  def super_params
    
    params.require(:article).permit(:title, :text, :time, :photo_url, :provider, :link, :author, :user_id, :photo)

  end
  

end
