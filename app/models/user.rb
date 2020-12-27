class User < ApplicationRecord
    has_many :owned_antiques, class_name: 'Antique' 
    has_many :markets, through: :owned_antiques
    has_many :favorites
    has_many :favorited_antiques, through: :favorties, foreign_key: 'antique_id'

    validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :about, length: { maximum: 200 }
end
