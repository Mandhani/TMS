json.extract! booking, :id, :quantity, :user_id, :tour_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
