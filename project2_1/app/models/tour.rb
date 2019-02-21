class Tour < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :photos
  has_many :users,through: :reviews
  has_many :users,through: :photos
end
