class Tour < ApplicationRecord
  validates :tour_name, :tour_id, :price, :book_deadline, :start_time, :end_time, :start_location,
            :total_seat, :available_seat, :status, presence: true
  validates :tour_id, uniqueness: true


end
