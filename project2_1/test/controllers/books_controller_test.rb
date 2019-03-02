
  require 'test_helper'

  class BooksControllerTest < ActionDispatch::IntegrationTest
    setup do
      @book = books(:one)
    end

    test "should get index" do
      get books_url
      assert_response :success
    end

    test "should get new" do
      get new_book_url
      assert_response :success
    end

    test "should create book" do
      assert_difference('Tour.count') do
        post books_url, params: { book: { book_seat: @book.book_seat, choice: @book.choice } }
      end

      assert_redirected_to book_url(Tour.last)
    end

    test "should show book" do
      get book_url(@book)
      assert_response :success
    end

    test "should get edit" do
      get edit_book_url(@book)
      assert_response :success
    end

    test "should update book" do
      patch book_url(@book), params: { book: { book_seat: @book.book_seat, choice: @book.choice } }
      assert_redirected_to book_url(@book)
    end

    test "should destroy book" do
      assert_difference('Tour.count', -1) do
        delete book_url(@book)
      end

      assert_redirected_to books_url
    end
  end
