json.extract! tour_interest_list, :id, :user_id, :tour_id, :created_at, :updated_at
json.url tour_interest_list_url(tour_interest_list, format: :json)
