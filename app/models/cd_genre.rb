class CdGenre < ApplicationRecord
	attachment :image
	belongs_to :genre
	belongs_to :cd
end
