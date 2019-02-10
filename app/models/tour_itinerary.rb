class TourItinerary < ApplicationRecord
  validates :tour_id, :country, :state_province, presence: true
end
