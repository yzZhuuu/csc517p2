class Review < ApplicationRecord
  validates :review_id, :user_id, :subject, presence: true
  validates :review_id, uniqueness: true

end
