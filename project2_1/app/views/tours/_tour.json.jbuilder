json.extract! tour, :id, :name, :description, :created_at, :updated_at, :price, :booking_deadline, :start_date, :end_date, :start_location, :contact_info, :total_seat
json.url tour_url(tour, format: :json)
