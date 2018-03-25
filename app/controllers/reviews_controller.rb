class ReviewsController < ApplicationController
	def new
		@review = Review.new
		@genres = Genre.all
	end

	def create
		@review = Review.new(review_params)
		@review.save
		redirect_to cds_path
	end


	private
	def review_params
		require(:review).permit(:comment, :star)
	end
end
