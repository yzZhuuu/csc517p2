class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :user_id, :tour_id, presence: true
end
