class Artist < ApplicationRecord
	attachment :image
	has_many :favorites
	has_many :cds
     validates :artist_name, presence: true
     validates :artist_kana_name, presence: true

end
