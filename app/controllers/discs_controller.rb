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
			@disc.save
	    	redirect_to new_cd_disc_path(@cd)

  		else params[:create_disc]
  			@disc.save

	    	redirect_to cds_path
	end
end

	def destroy

	end

private
def disc_params
	params.require(:disc).permit(:cd_id, :disc_num, :songs_attributes => [:song_name, :song_kana_name, :order_num, :minutes, :disc_id, :singer_id, :_destroy])

end
end
