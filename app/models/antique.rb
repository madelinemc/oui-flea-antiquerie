class Antique < ApplicationRecord
    belongs_to :market
    belongs_to :user
    belongs_to :category

    has_one_attached :antique_photo

    validates :description, length: { maximum: 200 }

    def market_attributes=(attributes)
        if !attributes["name"].blank?
            self.market = Market.find_or_create_by(name: attributes["name"])
        end
    end
    
end