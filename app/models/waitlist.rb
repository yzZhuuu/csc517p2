class Waitlist < ApplicationRecord
  validates :tour_id, :user_id, :wait_num, presence: true
end
