class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    belongs_to :prefecture
    has_one :cart
    has_many :favorites
    has_many :deliveries, dependent: :destroy
    has_many :cds, through: :reviews
    has_many :reviews
    has_many :histories

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :kana_first_name, presence: true
    validates :kana_last_name, presence: true
    validates :zipcode, presence: true
    validates :tel, presence: true , length: { minimum: 6 } # 6文字以上
    validates :prefecture_id, presence: true
    validates :address, presence: true
    validates :nickname, presence: true

    # kakurenbo-putiを使えるようにする
    soft_deletable

    # 論理削除済みのユーザーをログインできなくする
    def self.find_for_database_authentication(warden_conditions)
      without_soft_destroyed.where(email: warden_conditions[:email]).first
    end

end
