json.extract! order, :id, :name, :quantity, :user_id, :created_at, :updated_at
json.url order_url(order, format: :json)
