class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :payment_type, optional: true
  has_many :order_products  
  has_many :products, through: :order_products

  # def self.filter(filter)
  #   if filter
  #     where(company_id: filter)
  #   end
  # end

end
