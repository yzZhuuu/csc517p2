class Review < ApplicationRecord

  belongs_to :tour
  belongs_to :user

  validates :user_id, :tour_id, :subject, presence: true

end
