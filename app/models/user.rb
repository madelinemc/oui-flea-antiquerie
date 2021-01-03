class User < ApplicationRecord
    has_many :owned_antiques, class_name: 'Antique' 
    has_many :markets, through: :owned_antiques
    has_many :favorites
    has_many :favorited_antiques, through: :favorties, foreign_key: 'antique_id'

    has_one_attached :profile_picture

    validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :about, length: { maximum: 200 }

    has_secure_password

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.first_name = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end
    end
    
end
