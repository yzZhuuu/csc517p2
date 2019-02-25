require "administrate/base_dashboard"

class TourDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    reviews: Field::HasMany,
    photos: Field::HasMany,
    users: Field::HasMany,
    books: Field::HasMany,
    waitlists: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    created_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    updated_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    total_seat: Field::Number,
    aval_seat: Field::Number,
    status: Field::String,
    price: Field::Number,
    booking_deadline: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    start_date: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    end_date: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    start_location: Field::String,
    contact_info: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :id,
      :user,
      :name,
    #:status,
      :price,
      :aval_seat,
      :booking_deadline,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :name,
      :user,
      :id,
      :created_at,
      :updated_at,
      :description,
      :price,
      :start_date,
      :end_date,
      :booking_deadline,
      :start_location,
      :total_seat,
      :aval_seat,
      :status,
      :contact_info,
      #:photos,
      :books,
      :waitlists,
      :reviews,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :name,
    :description,
    :total_seat,
    :aval_seat,
    :price,
    :start_date,
    :end_date,
    :booking_deadline,
    :start_location,
  #:review,
  #:photos,
  ].freeze

  # Overwrite this method to customize how tours are displayed
  # across all pages of the admin dashboard.
  #
   def display_resource(tour)
     tour.name
   end

end
