class Market < ApplicationRecord
    has_many :antiques
    has_many :users, through: :antiques
    has_many :categories, through: :antiques

    validates :name, presence: true, uniqueness: true

end