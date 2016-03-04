json.array!(@users) do |user|
  json.extract! user, :id, :name, :money, :credit
  json.url user_url(user, format: :json)
end
