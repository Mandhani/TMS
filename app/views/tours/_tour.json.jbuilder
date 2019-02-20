json.extract! tour, :id, :name, :description, :price, :booking_deadline, :duration_start, :duration_end, :start_location, :itenary, :contact, :seats, :status, :waitlist, :created_at, :updated_at
json.url tour_url(tour, format: :json)
