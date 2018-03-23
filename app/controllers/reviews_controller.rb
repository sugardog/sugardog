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

	def index
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private
	def review_params
		require(:revirew).permit(:comment, :star)
	end
end
