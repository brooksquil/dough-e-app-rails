json.extract! company, :id, :company_name, :shipping_address, :shipping_address_2, :shipping_city, :shipping_state, :shipping_zipcode, :shipping_notes, :billing_street_address, :billing_address_2, :billing_state, :billing_zipcode, :company_phone, :company_email, :payment_terms, :is_active, :created_at, :updated_at
json.url company_url(company, format: :json)
