class PopImagesController < ApplicationController

	before_action :authenticate_admin?

	def index
		@pop_image = PopImage.new
		@pop_images = PopImage.all
		
	end
	def create
		@pop_images = PopImage.all
		@pop_image = PopImage.new(pop_image_params)
		@pop_image.save


if @pop_image.save
  			redirect_to pop_images_path
    	else
			render :index
		end


	end
	def destroy
		@pop_image = PopImage.find(params[:id])
		@pop_image.destroy
		redirect_to pop_images_path
	end

	private
	def pop_image_params
		params.require(:pop_image).permit(:image)
	end

	def authenticate_admin?
		redirect_to root_path unless admin_signed_in?
	end
end
