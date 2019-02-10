class Bookmark < ApplicationRecord
  validates :user_id, :tour_id, :bookmark_id, presence: true
  validates :bookmark_id, uniqueness: true
end
