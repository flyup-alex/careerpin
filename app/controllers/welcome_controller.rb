class WelcomeController < ApplicationController

before_action :authenticate_user!

  def index
  	    @ambasadors = current_user.ambasadors.all
  end

  def logout
  	
  	
  	

  end
end
