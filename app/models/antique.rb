class Antique < ApplicationRecord
    belongs_to :market
    belongs_to :user
    belongs_to :category

    has_one_attached :antique_photo

    validates :description, length: { maximum: 2200 }
end