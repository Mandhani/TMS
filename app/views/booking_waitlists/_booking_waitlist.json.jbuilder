json.extract! booking_waitlist, :id, :booking_id, :tour_id, :quantity, :created_at, :updated_at
json.url booking_waitlist_url(booking_waitlist, format: :json)
