class ArtistsController < ApplicationController

	def new
		@artist = Artist.new
	end
	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to artists_path
	end
	def index
		@artists = Artist.all
		@artist =Artist.new
	end
	def show
	   @artist = Artist.new
       @artist = Artist.find(params[:id])
	end
	def destroy
		@artist = Artist.find(params[:id])
		artist.destroy
		ridirect_to artists_path
	end
	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params)
		redirect_to artists_path
	end
	def edit
		@artist = Artist.find(params[:id])
	end

	private

    def artist_params
        params.require(:artist).permit(:artist_name, :artist_kana_name, :introduction, :image)

    end


end
