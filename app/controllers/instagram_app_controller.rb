class InstagramAppController < ApplicationController

include InstagramAppHelper

before_action :authenticate_user!

  def new
  	if current_user.providers.where(provider: "instagram").any?
  		redirect_to instagramfollowed_path
  	else
  		redirect_to '/auth/instagram'
  	end

  end

  def create
  	
  	@instagram_data = request.env['omniauth.auth']
  	Provider.create_or_find(request.env['omniauth.auth'], current_user )
  	redirect_to instagramfollowed_path
  
  end


  def followed

    instagram_pass

     @instagram = Instagram.user()  


  
 
  end

  def show

    instagram_pass

    @instagram = Instagram.user_recent_media("#{params[:user_id]}", {:count => 40})
    
  end
end
