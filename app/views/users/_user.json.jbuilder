json.extract! user, :id, :email, :first_name, :last_name, :username, :gender, :date_of_birth, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
