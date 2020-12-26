class Antique < ApplicationRecord
    belongs_to :market
    belongs_to :user
    belongs_to :category
end
