class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /tours
  # GET /tours.json
  def index
    @tours = Tour.all

    if params[:search]
      @tours = Tour.search(params[:search]).order("created_at DESC")
    else
      @tours = Tour.all.order('created_at DESC')
    end
  end

  # GET /tours/1
  # GET /tours/1.json
  def show

    @tour = Tour.find(params[:id])
    authorize @tour

    @review = Review.new
    @reviews = @tour.reviews

    @book = Book.new
    @books = @tour.books

    @waitlist = Waitlist.new
    @waitlists = @tour.waitlists

    @bookmark = Bookmark.new
    @bookmarks = @tour.bookmarks

    @flag = Bookmark.where(tour_id: @tour.id, user_id: current_user.id).any?



  end

  # GET /tours/new
  def new
    @tour = Tour.new
    authorize @tour
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create


    @tour = Tour.new(tour_params)
    authorize @tour

    @tour.user = current_user
    @tour.aval_seat = @tour.total_seat



    respond_to do |format|
      if @tour.save
        format.html {redirect_to @tour, notice: 'Tour was successfully created.'}
        format.json {render :show, status: :created, location: @tour}
      else
        format.html {render :new}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    authorize @tour
    respond_to do |format|
      if @tour.update(tour_params)
        format.html {redirect_to @tour, notice: 'Tour was successfully updated.'}
        format.json {render :show, status: :ok, location: @tour}
      else
        format.html {render :edit}
        format.json {render json: @tour.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    authorize @tour
    @tour.destroy
    respond_to do |format|
      format.html {redirect_to tours_url, notice: 'Tour was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tour_params
    params.require(:tour).permit(:name, :description, :total_seat, :aval_seat, :user_id, :price, :booking_deadline, :start_date, :end_date, :start_location, :contact_info)
  end
end
