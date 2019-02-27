class BooksController < ApplicationController


  before_action :authenticate_user!

  def create
    @tour = Tour.find(params[:tour_id])

    @book = @tour.books.new(book_params)

    authorize @book

    @book.user = current_user

    @tour.aval_seat = @tour.aval_seat - @book.book_seat

    # if the seats are enough for the booking
    if @tour.aval_seat >= 0

      # update the aval_seast in the tour
      if Tour.update(@tour.id, :aval_seat => @tour.aval_seat, :user_id => @tour.user_id)
        flash.now[:notice] = 'Available Seats updated!'
      else
        flash.now[:notice] = 'Error occurs!'
      end

      # save the booking info into books table
      respond_to do |format|
        if @book.save
          format.html {redirect_to @tour, notice: 'Option ignored. Book was successfully created.'}
          # format.json { render :show, status: :created, location: @tour }
        else
          format.html {redirect_to @tour, notice: 'Booking number not valid.'}
          # format.json { render json: @book.errors, status: :unprocessable_entity }
        end

      end

      # if the seats are not enough for the booking
    else

      # Based on the choice, do different operation
      # if nothing is selected, tell user to choose a option and redirect to the page again
      if @book.choice == 'nothing'
        respond_to do |format|
          format.html {redirect_to @tour, notice: 'Not enough available seats, please pick an option.'}
        end

        # if wait is selected, add the booking info into waitlist table
      elsif @book.choice == 'wait'

        @waitlist2 = Waitlist.new
        @waitlist2 = @tour.waitlists.new(:wait_seat => @book.book_seat, :user_id => current_user.id)

        if @waitlist2.save
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Option: wait picked. All booked seats move to the wait list'}
          end
        else
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Option: wait picked. Error occurs'}
          end
        end

        # if continue is selected, booking the aval seat and move the rest to waitlist tble
      elsif @book.choice == 'continue'

        @waitlist1 = Waitlist.new
        # update waitlist table
        @waitlist1 = @tour.waitlists.new(:wait_seat => (0 - @tour.aval_seat), :user_id => current_user.id)

        if @waitlist1.save
          flash.now[:notice] = 'Option: continue picked. Booking aval seats and move the rest to the waitlist'

        else
          flash.now[:notice] = 'Option: continue picked. Error occurs'
        end

        # update book table
        @book.book_seat = (@book.book_seat + @tour.aval_seat)

        if @book.save
          flash.now[:notice] = 'Available Seats updated!'
        else
          flash.now[:notice] = 'Error occurs!'
        end

        # update tour table for aval seat
        if Tour.update(@tour.id, :aval_seat => 0)
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Available Seats updated!'}
          end
        else
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Error occurs!'}
          end
        end

        # if cancel is selected, redirect to the tour page
      else
        respond_to do |format|
          format.html {redirect_to @tour, notice: 'Option: cancel picked. Booking operation cancelled'}
        end

      end

    end

  end

  def destroy

    @tour = Tour.find(params[:tour_id])
    @book = Book.find(params[:id])

    authorize @book

    # set up a local flag, if there is a row that needed to be popped up in waitlist, set flag to false
    # if there is no row to pop up, set flag to true. Default is true
    flag = true

    @waitlists = @tour.waitlists

    @waitlists.each do |w|

      if (w.wait_seat <= @book.book_seat)

        @book.book_seat = @book.book_seat - w.wait_seat

        @bookNew = @tour.books.new(:book_seat => w.wait_seat, :user_id => w.user_id, :choice => 'nothing')
        @bookNew.save

        Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + @book.book_seat))

        Waitlist.destroy(w.id)

        flag = false

        break

      end

    end

    # flag is true, just update the tour table for aval_seat
    if flag == true
      Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + @book.book_seat))
    end

    # destroy @book record anyway
    @book.destroy

    respond_to do |format|
      format.html {redirect_to @tour, notice: 'Booking was successfully destroyed. Waitlist list updated.'}
      # format.json { head :no_content }
    end

  end


  def edit
    @tour = Tour.find(params[:tour_id])
    @book = Book.find(params[:id])
    @book.user = current_user

    authorize @book

  end

  def update
    @tour = Tour.find(params[:tour_id])
    @book = Book.find(params[:id])

    authorize @book

    bookOld = @book.book_seat



    @book.update(book_params)

    if (@book.book_seat - bookOld) > @tour.aval_seat

      respond_to do |format|
        if Book.update(@book.id, :book_seat => bookOld)
          format.html {redirect_to edit_tour_book_path(@tour.id, @book.id), notice: 'Entered seats greated than aval seats'}
          # format.json { render :show, status: :ok, location: @tour }
        else
          # format.html {render :edit}
          # format.json { render json: @tour.errors, status: :unprocessable_entity }
        end
      end

    else

      @book = Book.find(params[:id])

      flag = true

      @waitlists = @tour.waitlists

      @waitlists.each do |w|

        if (w.wait_seat < bookOld)


          @book.book_seat = bookOld - @book.book_seat - w.wait_seat

          @bookNew = @tour.books.new(:book_seat => w.wait_seat, :user_id => w.user_id, :choice => 'nothing')
          @bookNew.save

          Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + @book.book_seat))

          Waitlist.destroy(w.id)

          flag = false

          break

        end

      end

      if flag == true
        Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + bookOld - @book.book_seat))
      end

      respond_to do |format|
        format.html {redirect_to @tour, notice: 'Booking info updated.'}
      end
    end

  end

  private

  def book_params
    params.require(:book).permit(:book_seat, :user_id, :choice)
  end

end
