json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :product_id, :created_at
  json.url user_order_url(@user, order, format: :json)
end
