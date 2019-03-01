class Tour < ApplicationRecord
#class Tour < ActiveRecord::Base
  # include Filterable
  #
  # filterrific(
  #     default_filter_params: { sorted_by: 'created_at_desc' },
  #     available_filters: [
  #         :sorted_by,
  #         :search_query,
  #         :with_country_id,
  #         :with_created_at_gte
  #     ]
  #)

  belongs_to :user
  has_many :reviews
  has_many :locations
  has_many :photos
  has_many :books
  has_many :waitlists
  has_many :bookmarks

  has_many :users,through: :reviews
  has_many :users,through: :photos
  has_many :users,through: :waitlists
  has_many :users,through: :books
  has_many :users,through: :bookmarks

  validates :total_seat, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

  # scope :status, -> (status) { where status: status }
  # scope :location, -> (location_id) { where location_id: location_id }
  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}




  # validates :book_seat, numericality: { only_integer: true }
end
