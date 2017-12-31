class User < ApplicationRecord
  rolify :before_add => :before_add_method  
  has_secure_password
  belongs_to :company
  has_many :orders
  
end
