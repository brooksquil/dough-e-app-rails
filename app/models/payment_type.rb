class PaymentType < ApplicationRecord
  resourcify
  has_many :orders
	belongs_to :company
end
