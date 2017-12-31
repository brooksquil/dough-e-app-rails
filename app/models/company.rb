class Company < ApplicationRecord
        resourcify
        has_many :payment_types
        validates_uniqueness_of :email 
end
