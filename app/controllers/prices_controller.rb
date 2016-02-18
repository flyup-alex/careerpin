class PricesController < ApplicationController

  def new

  	@price = Price.new

  end

  def create
	
  	@price = Price.new(super_params)

  end

private

def super_params

	params.require(:prices).permit(:user_ud, :account)
	
end

end
