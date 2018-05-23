json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :stock_quantity, :discount_percentage
  json.url product_url(product, format: :json)
end
