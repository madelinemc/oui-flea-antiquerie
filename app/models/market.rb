class Market < ApplicationRecord
    has_many :antiques, dependent: destory
    has_many :users, through: :antiques
    has_many :categories, through: :antiques

    validates :name, presence: true, uniqueness: true

end