class StandingOrder < ApplicationRecord
    resourcify
    has_many :order_products  
end
