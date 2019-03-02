require 'rails_helper'


RSpec.describe ToursController, type: :controller do

  test "should get new" do
    sign_in users(:admin), scope: :admin
    get new_tour_url
    assert_response :success
  end


end
