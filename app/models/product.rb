class Product < ApplicationRecord
  has_many :order_products
	has_many :orders, through: :order_products

  # Paperclip config
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
