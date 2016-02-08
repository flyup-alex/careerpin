class FacebookAppController < ApplicationController

include FacebookAppHelper

before_action :authenticate_user!

  def new

  	if current_user.providers.where(provider: "facebook").any?
  		redirect_to facebookfollowed_path
  	else
  		redirect_to '/auth/facebook'
  	end

  end

  def create

  	@facebook_data = request.env['omniauth.auth']
  	Provider.create_or_find(request.env['omniauth.auth'], current_user)
  	redirect_to facebookfollowed_path

     


  end

  def followed

    @ambasadors = current_user.ambasadors.where(provider: "facebook")
    @graph = facebook_data(current_user)
    

  end

  def search
    @graph = facebook_data(current_user)
    if params[:search].present? 
      if params[:times].nil? 
      params[:times] = 0
      end
    @search = @graph.search("#{params[:search]}", {:type => "page", limit: 5, :offset => "#{params[:times].to_i*5}"}) 
    

    end

    
    
  end

  def show
    if params[:times].nil? 
      params[:times] = 0
    end
     
    @graph = facebook_data(current_user)
       @feed = @graph.get_connection( params[:id] , 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture','full_picture', 'object_id', 'link', 'created_time', 'updated_time', 'place', 'actions' 

                        ], limit: 5, :offset => "#{params[:times].to_i*5}"})
    
    @ambasador = Ambasador.new

    if  current_user.ambasadors.where(provider: "facebook", object_id: "#{params[:id]}").exists?
      current_user.ambasadors.where(provider: "facebook", object_id: "#{params[:id]}").first.update(last_seen: Time.now)

        end


  end

  
end
