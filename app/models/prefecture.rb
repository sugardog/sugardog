class Prefecture < ApplicationRecord
	has_many :users
	has_many :deliveries, through: :users

	validates :prefecture_name, :postage, presence: true

end
