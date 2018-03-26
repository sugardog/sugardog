class Admin::ReviewsController < ApplicationController
	# before_action :authenticate_admin!
	def index
		if admin_signed_in?
			@reviews = Review.all
		elsif user_signed_in?
			@reviews = Review.where(user_id: current_user.id)
		else
			redirect_to user_session_path
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.delete
		redirect_to admin_reviews_path
	end
end

