class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
  belongs_to :payment_id
end
