json.extract! order, :id, :email, :status, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
