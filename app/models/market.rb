class Market < ApplicationRecord
    has_many :antiques
    has_many :users, through: :antiques
    has_many :categories, through: :antiques

    validates :location, presence: true
    validates :name, presence: true, uniqueness: true
    validates :number_of_vendors, numericality: true

end