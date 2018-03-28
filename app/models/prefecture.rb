class Prefecture < ApplicationRecord
	has_many :users
	has_many :deliveries, through: :users
	has_many :histories
	validates :prefecture_name, :postage, presence: true

end
