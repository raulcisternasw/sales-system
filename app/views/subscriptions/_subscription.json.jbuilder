json.extract! subscription, :id, :name, :description, :total_amount, :is_active, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
