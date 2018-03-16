class ArtistsController < ApplicationController

	def new
		@artist = Artist.new
		@singer = Singer.new
	end
	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			@singer = Singer.new
			@singer.singer_name = params[:artist][:artist_name]
			@singer.singer_kana_name = params[:artist][:artist_kana_name]
			@singer.save
		end
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
		if artist = Artist.find(params[:id])
			@signger = Singer.find(params[:id])
		end

		if artist.destroy
				singer.destroy
		end
		ridirect_to artists_path
	end
	def update
		@artist = Artist.find(params[:id])
		@singer = Singer.find(params[:id])
		@artist.update(artist_params)
		@singer.update(singer_params)
		redirect_to artists_path
	end
	def edit
		@artist = Artist.find(params[:id])
		@singer = Singer.find(params[:id])
	end

	private

    def artist_params
        params.require(:artist).permit(:artist_name, :artist_kana_name, :introduction, :image)

    end
    def singer_params
        params.require(:singer).permit(:singer_name, :singer_kana_name)

    end


end
