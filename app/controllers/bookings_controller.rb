class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/option
  def option
    @booking = Booking.new
    @booking.user_id = params[:user_id]
    @booking.tour_id = params[:tour_id]
    @booking.quantity = params[:quantity]
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    available_tickets = Tour.find(booking_params[:tour_id]).seats
    desired_tickets = booking_params[:quantity].to_i
    if booking_params[:option].to_i == 0
      if desired_tickets > available_tickets
        redirect_to( :controller => 'bookings', :action => 'option', :user_id => booking_params[:user_id], :tour_id => booking_params[:tour_id], :quantity => booking_params[:quantity])
        return
        #format.html { redirect_to :option, notice: 'Number of requested seats exceed the number of available seats.'}
        #format.json { render :option, status: :unprocessable_entity, location: @booking }
      else
        book_tickets(desired_tickets)
        return
      end
    end
    if desired_tickets <= available_tickets
      book_tickets(booking_params[:quantity].to_i)
    else
      if booking_params[:option].to_i == 1
        book_tickets(available_tickets)
        waitlist_tickets(desired_tickets - available_tickets)
      elsif booking_params[:option].to_i == 2
        book_tickets(0)
        waitlist_tickets(desired_tickets)
      else
        #Cancel transaction
        redirect_to( :controller => 'tours', :action => 'index')
        return
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def book_tickets(count)
      @booking = Booking.new(booking_params)
      @booking.quantity = count
      respond_to do |format|
      #reduce available seats in tours model
      @tours = Tour.find(booking_params[:tour_id])
        if @booking.save && @tours.update( seats: @tours.seats - count)
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          format.html { render :index }
          format.json { render json: [@booking.errors,@tours.errors], status: :unprocessable_entity }
        end
      end
    end

    def waitlist_tickets(count)
      #TBD
      return
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:quantity, :user_id, :tour_id, :option)
    end
end
