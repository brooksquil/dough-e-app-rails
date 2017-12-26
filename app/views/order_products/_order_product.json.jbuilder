json.extract! order_product, :id, :quantity, :order_id, :product_id, :standing_order_id, :created_at, :updated_at
json.url order_product_url(order_product, format: :json)
