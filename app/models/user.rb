class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    belongs_to :prefecture
    has_one :cart
    has_many :artists, through: :favorites, dependent: :destroy
    has_many :favorites
    has_many :deliveries, dependent: :destroy
    has_many :cds, through: :reviews
    has_many :reviews
    has_many :histories

end
