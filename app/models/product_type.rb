class ProductType < ApplicationRecord
    resourcify
    has_many :products
end
