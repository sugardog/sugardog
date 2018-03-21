class Cart < ApplicationRecord
	has_many :cd_carts
	has_many :cds, through: :cd_carts
	belongs_to :user
end
