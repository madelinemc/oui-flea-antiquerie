class Market < ApplicationRecord
    has_many :antiques, dependent: :destroy
    has_many :users, through: :antiques
    has_many :categories, through: :antiques

    validates :name, presence: true, uniqueness: true

    has_one_attached :market_photo

end