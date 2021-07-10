json.extract! event, :id, :name, :user_id, :description, :status, :costing, :price, :duration, :address, :created_at, :updated_at
json.url event_url(event, format: :json)
