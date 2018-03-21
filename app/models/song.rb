class Song < ApplicationRecord
	belongs_to :disc
	belongs_to :singer

end