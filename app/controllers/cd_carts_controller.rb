class CdCartsController < ApplicationController
	def new
		@carts = Cart.all
		@cd_carts = CdCart.all
		@cds = Cds.all
		@cd = Cd.find(params[:id])
		@user = current_user
	end

	def create
		@cd = Cd.find(params[:cd_id])
		
		if Cart.find_by(user_id: current_user)
			@cart = Cart.find_by(user_id: current_user)
			@cd_cart = CdCart.new(cd_cart_params)
			@cd_cart.cart_id = @cart.id
			@cd_cart.cd_id = @cd.id
			@cd_cart.save
			redirect_to cart_path(@cart.id) 
		else
			@cart = Cart.new
			@cart.user_id = current_user.id
			@cart.save
			@cd_cart = CdCart.new(cd_cart_params)
			@cd_cart.cart_id = @cart.id
			@cd_cart.cd_id = @cd.id
			@cd_cart.save
			redirect_to cart_path(@cart.id) 
		end
	end

	def index
		
	end

	def show
		
	end

	def edit
		@cd_carts = CdCart.all
	
	end

	def update
		@cd_cart = CdCart.find(params[:cd_id])
		@cd_cart.update(cd_cart_params)
		@cart = Cart.find_by(user_id: current_user)
		redirect_to cart_path(@cart.id)
	end

	def destroy
		cd_cart = CdCart.find(params[:cd_id])
		cd_cart.destroy
		@cart = Cart.find_by(user_id: current_user)
		redirect_to cart_path(@cart.id)
	end

private
	def cart_params
		params.require(:cart).permit(:user_id)
	end
	def cd_cart_params
		params.require(:cd_cart).permit(:cd_id, :count, :cart_id)
	end

end