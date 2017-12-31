class OrderProduct < ApplicationRecord
  resourcify
  belongs_to :order
  belongs_to :product
end
