class CartsController < ApplicationController

def show
	@cds = Cd.all
	@cart = Cart.find(params[:id])
	@cd_carts = CdCart.all
end

def select

	@user = User.find(current_user[:id])
	@deliveries = Delivery.all
end

def confirm
	
end
end
