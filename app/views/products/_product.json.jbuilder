json.extract! product, :id, :name, :description, :price, :available, :product_type_id, :quantity_type_id, :company_id, :created_at, :updated_at
json.url product_url(product, format: :json)
