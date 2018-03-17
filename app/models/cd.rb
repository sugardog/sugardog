class Cd < ApplicationRecord
	attachment :image
	has_many :genres
	belongs_to :artist
end
