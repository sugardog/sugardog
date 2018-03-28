class History < ApplicationRecord

	enum status:{受付中: 0,準備中: 1,発送済み: 2}

	attr_accessor :delivery_id
	has_many :cds, through: :cd_histories
	belongs_to :user
	belongs_to :prefecture
	has_many :cd_histories
	accepts_nested_attributes_for :cd_histories

	# kakurenbo-putiを使えるようにする
    soft_deletable

end
