require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  setup do
    @tour = tours(:one)
    # @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in User.create(:name => 'GodOfWeb',:role => 'admin',:email => 'god@admin.com', :password => 'password', :password_confirmation => 'password')

  end

  # test "should get index" do
  #   sign_in users(:admin), scope: :admin
  #   get tours_url
  #   assert_response :success
  # end

  test "should get new" do
    sign_in users(:admin), scope: :admin
    get new_tour_url
    assert_response :success
  end

  # test "should create tour" do
  #   sign_in users(:admin), scope: :admin
  #   assert_difference('Tour.count') do
  #     post tours_url, params: { tour: { description: @tour.description, name: @tour.name } }
  #   end
  #   assert_redirected_to tour_url(Tour.last)
  # end

  # test "should show tour" do
  #   get tour_url(@tour)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_tour_url(@tour)
  #   assert_response :success
  # end

  # test "should update tour" do
  #   patch tour_url(@tour), params: { tour: { description: @tour.description, name: @tour.name } }
  #   assert_redirected_to tour_url(@tour)
  # end

  # test "should destroy tour" do
  #   assert_difference('Tour.count', -1) do
  #     delete tour_url(@tour)
  #   end
  #   assert_redirected_to tours_url
  # end

end
