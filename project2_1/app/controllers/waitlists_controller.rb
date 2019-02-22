class WaitlistsController < ApplicationController

  def index

  end

  def destroy
    @tour = Tour.find(params[:tour_id])

    @waitlist = Waitlist.find(params[:id])
    authorize @waitlist


    @waitlist.destroy



    respond_to do |format|
      format.html { redirect_to @tour, notice: 'Waitlist was successfully destroyed.' }
      # format.json { head :no_content }
    end

  end

end
