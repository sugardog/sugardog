class Admin::DeliveriesController < ApplicationController

	before_action :autenticate_user?

	def new
		@delivery = Delivery.new
	end

	def create
		delivery = Delivery.new(delivery_params)
		delivery.user_id = current_user.id
		delivery.save
		redirect_to admin_user_path(current_user.id)
	end

	def edit
		@delivery = Delivery.find(params[:id])
	end

	def update
		delivery = Delivery.find(params[:id])
		delivery.save(delivery_params)
		redirect_to admin_user_path()
	end

	def destroy
		delivery = Delivery.find(params[:id])
		delivery.destroy
		redirect_to admin_user_path(current_user)
	end

	private

	def delivery_params
		params.require(:delivery).permit(:prefecture_id, :address, :zipcode, :name, :tel, :user_id)
	end

	def authenticate_user?
	end

end
