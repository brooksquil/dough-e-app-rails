class Company < ApplicationRecord
        has_many :payment_types
        validates_uniqueness_of :email 
end
