class Prefecture < ApplicationRecord
	has_many :users
	has_many :deliveries, through: :users
end
