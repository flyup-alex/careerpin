class FacebookAppController < ApplicationController
before_action :authenticate_user!

  def create

  	@facebook_data = request.env['omniauth.auth']
  	Provider.create_or_find(request.env['omniauth.auth'], current_user)
  	

  end

  def followed
  	

  end
end
