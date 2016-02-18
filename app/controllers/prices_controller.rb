class PricesController < ApplicationController

  def new

  	@price = Price.new

  end

  def create

	@price = Price.new(super_params)
	if @price.save 
	  	redirect_to root_path
	  	flash[:success] = "Witamy w Career-Pin"
	else
	 	current_user.destroy
	 	redirect_to root_path
	 end

  end

private

def super_params

	params.require(:price).permit(:user_id, :account)
	
end

end
