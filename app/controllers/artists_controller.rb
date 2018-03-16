class ArtistsController < ApplicationController

	def new
		@artist = Artist.new
		@singer = Singer.new
		@cd = Cd.new
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
	  	if params[:id].present?
	    	@artist = Artist.find(params[:id])
	  	else
	   		@artist = Artist.new
	  	end
	end
	def show
	   @artist = Artist.new
       @artist = Artist.find(params[:id])
       @cds = Cd.all
       @cd = Cd.new
       
	end

	def destroy
		@artist = Artist.find(params[:id])
  		@artist.destroy
  		redirect_to artists_path
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
    def singer_params
        params.require(:singer).permit(:singer_name, :singer_kana_name)

    end


end
