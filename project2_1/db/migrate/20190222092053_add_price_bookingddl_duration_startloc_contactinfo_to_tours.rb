class AddPriceBookingddlDurationStartlocContactinfoToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :price, :decimal
    add_column :tours, :booking_deadline, :date
    add_column :tours, :start_date, :date
    add_column :tours, :end_date, :date
    add_column :tours, :start_location, :string
    add_column :tours, :contact_info, :string
  end
end
