class Waitlist < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :wait_seat, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, :tour_id, :wait_seat, presence: true

end
