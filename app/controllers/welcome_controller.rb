class WelcomeController < ApplicationController

include FacebookAppHelper
before_action :authenticate_user!

  def index	  
  end


  def logout
  end
end
