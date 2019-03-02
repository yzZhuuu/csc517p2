class Photo < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :user_id, :tour_id, :image, presence: true

end
