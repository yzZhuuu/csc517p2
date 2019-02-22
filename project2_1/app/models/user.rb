class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tours
  has_many :reviews
  has_many :photos
  has_many :waitlists
  has_many :books
  has_many :bookmarks

end
