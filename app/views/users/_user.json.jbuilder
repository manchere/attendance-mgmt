schejson.extract! user, :id, :first_name, :last_name, :phone_number, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
