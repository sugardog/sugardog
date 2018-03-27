class Delivery < ApplicationRecord
	belongs_to :user
	belongs_to :prefecture


    validates :address, :zipcode, :tel, :name, presence: true
end
