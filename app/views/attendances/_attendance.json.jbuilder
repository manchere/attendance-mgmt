json.extract! attendance, :id, :status, :datetime_of_presence, :present, :body_temperature, :user_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
