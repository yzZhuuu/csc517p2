class Booking < ApplicationRecord
  validates :booking_id,:user_id, :tour_id, :booked_seat, presence: true

end
