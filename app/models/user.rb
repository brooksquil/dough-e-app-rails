class User < ApplicationRecord
  has_secure_password
  belongs_to :company
  has_many :orders
end
