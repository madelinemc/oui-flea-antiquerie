class User < ApplicationRecord
    has_many :owned_antiques, class_name: 'Antique' 
    has_many :markets, through: :owned_antiques
    has_many :favorites
    has_many :favorited_antiques, through: :favorties, foreign_key: 'antique_id'
end
