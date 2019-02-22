class BooksController < ApplicationController


  before_action :authenticate_user!

  def create
    @tour = Tour.find(params[:tour_id])


    @book = @tour.books.create(book_params)

    authorize @book

    @book.user = current_user


    @tour.aval_seat = @tour.aval_seat - @book.book_seat


    if @tour.aval_seat >= 0

      if Tour.update(@tour.id, :aval_seat => @tour.aval_seat)
        flash.now[:notice] = 'Available Seats updated!'
      else
        flash.now[:notice] = 'Error occurs!'
      end


      respond_to do |format|
        if @book.save
          format.html {redirect_to @tour, notice: 'Option ignored. Book was successfully created.'}
          # format.json { render :show, status: :created, location: @tour }
        else
          format.html {redirect_to @tour, notice: 'Booking number not valid.'}
          # format.json { render json: @book.errors, status: :unprocessable_entity }
        end


      end

    else


      if @book.choice == 'nothing'
        respond_to do |format|
          format.html {redirect_to @tour, notice: 'Not enough available seats, please pick an option.'}
          # format.json { render :show, status: :created, location: @tour }
        end

      elsif @book.choice == 'wait'

        @waitlist2 = Waitlist.new
        @waitlist2 = @tour.waitlists.create(:wait_seat => @book.book_seat, :user_id => @tour.user_id)

        if @waitlist2.save
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Option: wait picked. All booked seats move to the wait list'}
            # format.json { render :show, status: :created, location: @tour }
          end
        else
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Option: wait picked. Error occurs'}
            # format.json { render :show, status: :created, location: @tour }
          end
        end

      elsif @book.choice == 'continue'


        @waitlist1 = Waitlist.new
        @waitlist1 = @tour.waitlists.create(:wait_seat => (0 - @tour.aval_seat), :user_id => @tour.user_id)

        if @waitlist1.save

          flash.now[:notice] = 'Option: continue picked. Booking aval seats and move the rest to the waitlist'
          # format.json { render :show, status: :created, location: @tour }

        else

          flash.now[:notice] = 'Option: continue picked. Error occurs'
          # format.json { render :show, status: :created, location: @tour }

        end

        @book.book_seat = (@book.book_seat + @tour.aval_seat)

        if @book.save
          flash.now[:notice] = 'Available Seats updated!'
          # format.json { render :show, status: :created, location: @tour }
        else
          flash.now[:notice] = 'Error occurs!'
          # format.json { render json: @book.errors, status: :unprocessable_entity }
        end


        if Tour.update(@tour.id, :aval_seat => 0)
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Available Seats updated!'}
            # format.json { render :show, status: :created, location: @tour }
          end
        else
          respond_to do |format|
            format.html {redirect_to @tour, notice: 'Error occurs!'}
            # format.json { render :show, status: :created, location: @tour }
          end
        end


      else
        respond_to do |format|
          format.html {redirect_to @tour, notice: 'Option: cancel picked. Booking operation cancelled'}
          # format.json { render :show, status: :created, location: @tour }
        end


      end


    end


  end

  def destroy

    @tour = Tour.find(params[:tour_id])

    @book = Book.find(params[:id])

    authorize @book

    flag = true

    @waitlists = @tour.waitlists

    @waitlists.each do |w|

      if (w.wait_seat < @book.book_seat)


        @book.book_seat = @book.book_seat - w.wait_seat

        @bookNew = @tour.books.create(:book_seat => w.wait_seat, :user_id => w.user_id, :choice => 'nothing')
        @bookNew.save

        Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + @book.book_seat))

        Waitlist.destroy(w.id)

        flag = false

        break

      end

    end

    if flag == true
      Tour.update(@tour.id, :aval_seat => (@tour.aval_seat + @book.book_seat))
    end


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

    bookOld = @book.book_seat

    authorize @book

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

          @bookNew = @tour.books.create(:book_seat => w.wait_seat, :user_id => w.user_id, :choice => 'nothing')
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
        # format.json { render :show, status: :ok, location: @tour }

        # format.html {render :edit}
        # format.json { render json: @tour.errors, status: :unprocessable_entity }

      end

    end


  end

  private

  def book_params
    params.require(:book).permit(:book_seat, :user_id, :choice)
  end

end
