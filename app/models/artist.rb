class Artist < ApplicationRecord
	attachment :image
	has_many :favorites, dependent: :destroy
	has_many :cds
	has_many :users, through: :favorites

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

     validates :artist_name, presence: true
     validates :artist_kana_name, presence: true

end
