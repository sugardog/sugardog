class GenresController < ApplicationController
	def create
	@genre = Genre.new(genre_params)
	@genre.save
	redirect_to genres_path
	end

	def index
		@genres = Genre.all
		@genre = Genre.new
	end

	def show
		@genres = Genre.all
		@genre = Genre.find(params[:id])
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


end
