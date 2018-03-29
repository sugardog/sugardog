class ReviewsController < ApplicationController

	before_action :authenticate_user?, except: [:index]

	def new
		if Review.find_by(cd_id: params[:cd_id] , user_id: current_user)
			redirect_to user_history_path(current_user), flash: {review: "既に記入済みです"}
		else
		@cd = Cd.find(params[:cd_id])
		@review = Review.new
		end
	end

	def create
		@cd = Cd.find(params[:cd_id])
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.cd_id = @cd.id
		@review.save
		redirect_to cd_reviews_path
	end

	def edit
		@review = Review.find(params[:cd_id])
	end

	def update
		review = Review.find(params[:cd_id])
		review.update(review_params)
		redirect_to admin_reviews_path
	end

	def index
		@cd = Cd.find(params[:cd_id])
		@rankings = Ranking.order("rank asc")
		@genres = Genre.all
		@reviews = Review.all
		@star5 = @cd.reviews.where(star: 5)
		@star4 = @cd.reviews.where(star: 4)
		@star3 = @cd.reviews.where(star: 3)
		@star2 = @cd.reviews.where(star: 2)
		@star1 = @cd.reviews.where(star: 1)
	end

	private
	def review_params
		params.require(:review).permit(:comment, :star, :user_id, :cd_id)
	end

	# admin又はuserでログインしていなければ、ページは見れないようにする
	def authenticate_user?
		redirect_to root_path unless user_signed_in? || admin_signed_in?
	end

end
