class CartsController < ApplicationController

	def show
		@cds = Cd.all
		@cart = Cart.find(params[:id])
		@cd_carts = CdCart.all
	end

	def select
		@user = User.find(current_user[:id])
		@deliveries = Delivery.all
		@history = @user.histories.new
	end

	def confirm
		@cart = Cart.find(params[:id])
		@user = User.find(current_user[:id])
		@history = @user.histories.new
		@history.cd_histories.build
		delivery_id = params[:history][:delivery_id].to_i
		if delivery_id == 0
			@delivery = current_user
			@name = current_user.last_name + current_user.first_name
		else
			@delivery = @user.deliveries.find(delivery_id)
			@name = @delivery.name
		end
	end

end