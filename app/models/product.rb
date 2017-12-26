class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :quantity_type
  belongs_to :company
end
