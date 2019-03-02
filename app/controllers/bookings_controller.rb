class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    if(User.find(current_user.id).user_type == 1)
      @bookings = Booking.all
    elsif User.find(current_user.id).user_type == 2
      @bookings = Booking.all.where(user_id: current_user.id)
    elsif User.find(current_user.id).user_type == 3
      @bookings = Booking.all.where(tour_id: Tour.all.where(user_id: current_user.id))
    end
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
        redirect_to( :action => 'option', :user_id => booking_params[:user_id], :tour_id => booking_params[:tour_id], :quantity => booking_params[:quantity], status: 301)
        return
      else
        book_tickets(desired_tickets)
        return
      end
    end
    if desired_tickets <= available_tickets
      book_tickets(booking_params[:quantity].to_i)
    else
      if booking_params[:option].to_i == 1
        book_with_waitlist(available_tickets, desired_tickets - available_tickets)
      elsif booking_params[:option].to_i == 2
        book_with_waitlist(0, desired_tickets)
      else
        #Cancel transaction
        redirect_to( :controller => 'tours', :action => 'show', :id => booking_params[:tour_id])
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
    new_seats = @booking.quantity
    @tour_affected = Tour.find(@booking.tour_id)
    available_seats = @tour_affected.seats + new_seats
    @waitlist_selected = BookingWaitlist.where("tour_id = ? AND quantity <= ?",@booking.tour_id, available_seats ).order(:created_at).limit(1).first
    # Alloting seats to another booking
    if @waitlist_selected
      @booking_selected = Booking.find(@waitlist_selected.booking_id)
      @booking_selected.quantity = @booking_selected.quantity + @waitlist_selected.quantity
      @booking_selected.save
      # Updating tour to increase seats, if any
      @tour_affected.seats += (@booking.quantity - @waitlist_selected.quantity)
      @tour_affected.waitlist -= @waitlist_selected.quantity
      @tour_affected.save
      # delete waitlist
      @waitlist_selected.destroy
    else
      @tour_affected.seats += @booking.quantity
      @tour_affected.save
    end
    #delete old booking now
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
          if @tour
            @booking.errors.copy!(@tour.errors)
          end
          format.html { render :index }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
    end

    def book_with_waitlist(book_count, wait_count)
      @booking = Booking.new(booking_params)
      @booking.quantity = book_count
      #Update waitlist
      @booking_waitlist = BookingWaitlist.new
      @booking_waitlist.tour_id = booking_params[:tour_id]
      @booking_waitlist.quantity = wait_count
      #reduce available seats in tours model
      @tours = Tour.find(booking_params[:tour_id])
      respond_to do |format|
        if @booking.save && @tours.update( seats: @tours.seats - book_count, waitlist: @tours.waitlist + wait_count)
          @booking_waitlist.booking_id = @booking.id
          if !@booking_waitlist.save
            if @booking_waitlist
              @booking.errors.copy!(@booking_waitlist.errors)
            end
            format.html { render :option }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
          format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
          format.json { render :show, status: :created, location: @booking }
        else
          if @tour
            @booking.errors.copy!(@tour.errors)
          end
          format.html { render :option }
          format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      end
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
