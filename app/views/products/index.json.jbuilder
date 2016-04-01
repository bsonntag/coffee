json.array!(@products) do |product|
  json.extract! product, :id, :name, :category, :price, :color, :icon, :created_at, :updated_at
  json.url product_url(product, format: :json)
end
