class Cd < ApplicationRecord
	attachment :image
	has_many :genres
end
