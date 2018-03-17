class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    belongs_to :prefecture
    has_one :cart
    has_many :favorites, through: :artists, dependent: :destroy
    has_many :deliveries, through: :prefectures, dependent: :destroy
    has_many :reviews, through: :cds, dependent: :destroy
    has_many :histories, through: :deliveries

end
