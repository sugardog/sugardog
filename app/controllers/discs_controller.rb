class DiscsController < ApplicationController

	def new
		@cd = Cd.find(params[:cd_id])
			@disc = Disc.new
			@song = Song.new
	end

	def create
		@cd = Cd.find(params[:cd_id])
		@disc = Disc.new(disc_params)
		@disc.cd_id = @cd.id
		if params[:add_disc]
			if @disc.save
	    		redirect_to new_cd_disc_path(@cd)
	    	else
	    		render :new
	    	end
  		elsif params[:create_disc]
  			if @disc.save
	    		redirect_to cds_path
	    	else
	    		render :new
	    	end
		end
	end
	def edit
		@cd = Cd.find(params[:cd_id])
		@disc = Disc.find(params[:id])
		@songs = @disc.songs

	end
	def update
		@cd = Cd.find(params[:cd_id])
		@disc = Disc.find(params[:id])
		@songs = disc.songs
		@disc.update(disc_params)
		redirect_to cd_path(cd)
	end


	def destroy
		@cd =Cd.find(params[:cd_id])
		@disc = Disc.find(params[:id])
  		@disc.destroy
  		redirect_to cd_path(@cd)
	end

private
def disc_params
	params.require(:disc).permit(:cd_id, :disc_num, :songs_attributes => [:id, :song_name, :song_kana_name, :order_num, :minutes, :disc_id, :singer_id, :_destroy])

end
end