class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@genres = Genre.all
	end

	def create
		@cd = Cd.find(params[:id])
		@review = Review.new(review_params)
		@review.save
		redirect_to cd_reviews_path(@cd)
	end

	def index
		@cd = Cd.find(params[:cd_id])
		@reviews = Review.all
	end


	private
	def review_params
		require(:review).permit(:comment, :star)
	end
end
