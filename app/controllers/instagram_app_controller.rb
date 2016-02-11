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

    Instagram.configure do |config|

    config.client_id = "2929837f1ff24f8cabccd1a47a07b53b"

    config.access_token = "#{current_user.providers.where(provider: "instagram").first.token1}"

    end

  @instagram = Instagram.user_recent_media("1627109417", {:count => 1})
  @instagram2 = Instagram.user()	
  end
end
