class QuantityType < ApplicationRecord
    resourcify
    has_many :products
end
