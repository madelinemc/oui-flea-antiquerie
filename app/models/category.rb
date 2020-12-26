class Category < ApplicationRecord
    has_many :antiques
    has_many :users, through: :antiques
    has_many :markets, through: :antiques

    validates :title, presence: true
end
