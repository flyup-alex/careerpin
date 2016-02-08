class AmbasadorsController < ApplicationController
  def show
  	
  		@ambasador = Ambasador.find(params[:id])
  		if params[:times].nil? 
     	 params[:times] = 0
    	end

    	if @ambasador.provider = "facebook"
     
    	@graph = facebook_data(current_user)
     	@feed = @graph.get_connection( params[:id] , 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture','full_picture', 'object_id', 'link', 'created_time', 'updated_time', 'place', 'actions' 

                        ], limit: 5, :offset => "#{params[:times].to_i*5}"})

     	end

  	  end

  def delete
  end

  def index

  		@ambasadors = Ambasador.all

  end

  def create

  	@ambasador = Ambasador.new(super_params)
  	if @ambasador.save
  	redirect_to facebookfollowed_path
  	else
  	render 'index'
  	end
  
  end


    


  private

  def super_params

    params.require(:ambasador).permit(:provider, :last_seen, :object_id, :user_id, :name)
    
  end


end
