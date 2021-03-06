class ArtistsController < ApplicationController

	# adminの認証
	before_action :authenticate_admin?, except: [:index, :show]

	def new
		@artist = Artist.new
		@singer = Singer.new
		@cd = Cd.new
	end
	def create
		@artists = Artist.all
		@artist = Artist.new(artist_params)

		if @artist.save
			@singer = Singer.new
			@singer.singer_name = params[:artist][:artist_name]
			@singer.singer_kana_name = params[:artist][:artist_kana_name]
			@singer.save
  			redirect_to artists_path
    	else
    		@q = Artist.ransack(params[:q])
    		@searches = @q.result
			render :index
		end
	end

	def index
		@artist =Artist.new
	  	if params[:id].present?
	    	@artist = Artist.find(params[:id])
	  	else
	   		@artist = Artist.new
	  	end
	  	@q = Artist.ransack(params[:q])
	  	@searches = @q.result
	end
	def show
	   @genres = Genre.all
       @artist = Artist.find(params[:id])
       @cds = Cd.all
       @cd = Cd.new
       @rankings = Ranking.all
       @rankings = Ranking.order("rank asc")
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

	# adminでログインしていなければ、root_pathにリダイレクトされる
    def authenticate_admin?
		redirect_to root_path unless admin_signed_in?
    end


end
