class History < ApplicationRecord
	attr_accessor :delivery_id
	enum status:{受付: 0,準備中: 1,発送済: 2}

	has_many :cd_histories
	accepts_nested_attributes_for :cd_histories
	has_many :cds, through: :cd_histories
	belongs_to :user

end
