class Photo < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  mount_uploader :image, ImageUploader
end
