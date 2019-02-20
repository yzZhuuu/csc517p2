class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def create
    @tour = Tour.find(params[:tour_id])
    @review = @tour.reviews.create(review_params)
    @review.user = current_user

    authorize @review

    if @review.save
      redirect_to @tour
    end


  end

  def edit
    @tour = Tour.find(params[:tour_id])
    @review = Review.find(params[:id])
    @review.user = current_user

    authorize @review

  end

  def update
    @tour = Tour.find(params[:tour_id])
    @review = Review.find(params[:id])
    authorize @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to tour_path(@tour), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tour = Tour.find(params[:tour_id])

    @review = Review.find(params[:id])
    authorize @review

    @review.destroy

    respond_to do |format|
      format.html { redirect_to @tour, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private

  def review_params
    params.require(:review).permit(:review, :user_id)
  end
end
