class InstagramAppController < ApplicationController

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

  	
  end
end
