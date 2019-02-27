class BookmarksController < ApplicationController

  def create
    @tour = Tour.find(params[:tour_id])

    @bookmark = @tour.bookmarks.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @tour, notice: 'Bookmark created.' }
      else
        format.html { redirect_to @tour, notice: 'Error occurs.' }
      end
    end

  end


  def destroy
    @tour = Tour.find(params[:tour_id])

    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to @tour, notice: 'Bookmark was successfully destroyed.' }
      # format.json { head :no_content }
    end

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id)
  end


end


