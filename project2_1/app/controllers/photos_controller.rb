class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    @tour = Tour.find(params[:tour_id])
  end

  def new

    @tour = Tour.find(params[:tour_id])

    @photo = @tour.photos.new

  end

  def create

    @tour = Tour.find(params[:tour_id])


    @photo = @tour.photos.new(photo_params)

    # authorize @photo

    if @photo.image.file.nil?

      # Photo.destroy(@photo.id)

      respond_to do |format|
        format.html {redirect_to new_tour_photo_path, notice: 'No Image is selected'}
      end

    else

      if @photo.save
      respond_to do |format|
        format.html {redirect_to tour_photos_path, notice: 'Image is uploaded'}
      end

      else
        respond_to do |format|
          format.html {redirect_to new_tour_photo_url, notice: 'Image is not saved'}
        end
      end

    end

  end

  def destroy
    @tour = Tour.find(params[:tour_id])

    @photo = Photo.find(params[:id])

    authorize @photo

    @photo.destroy

    respond_to do |format|
      format.html {redirect_to tour_photos_path, notice: 'Image was successfully destroyed.'}
      # format.json { head :no_content }
    end

  end

  private

  def photo_params
    params.require(:photo).permit(:image, :user_id)
  end
end
