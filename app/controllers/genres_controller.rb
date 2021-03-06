class GenresController < ApplicationController

	before_action :authenticate_admin?, except: [:index, :show]

	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to genres_path
		else
			@genres = Genre.all
			render :index
		end
	end

	def show
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@cd_genres = CdGenre.all
		@rankings = Ranking.all
       @rankings = Ranking.order("rank asc")
	end

	def edit
		@genres = Genre.all
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to genres_path
	end

	def destroy
		@genre = Genre.find(params[:id])
		@genre.delete
		redirect_to genres_path
	end

	private
	def genre_params
		params.require(:genre).permit(:genre_name)
	end

	def authenticate_admin?
		redirect_to root_path unless admin_signed_in?
	end

end
