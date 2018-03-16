class Artist < ApplicationRecord
	attachment :image
	has_many :favorite
	has_many :cds


end
