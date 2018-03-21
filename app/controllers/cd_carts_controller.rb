class CdCartsController < ApplicationController
	def new
		@cd_carts = CdCart.all
		@cds = Cds.all
	end

	def create
		@cd_cart = CdCart.new(cd_cart_params)
		cd_cart.save
		redirect_toedit_cd_cart_path(@cd_cart) 
	end

	def index
		
	end

	def show
		
	end

	def edit
		@cd_carts = CdCart.all
	end

	def update
		
	end

	def destroy
		
	end

private
	def cd_cart_params
		params.require(:cd_cart).permit(:cd_id, :count, :cart_id)
	end

end