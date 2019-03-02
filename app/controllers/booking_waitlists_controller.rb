class BookingWaitlistsController < ApplicationController
  before_action :set_booking_waitlist, only: [:show, :edit, :update, :destroy]

  # GET /booking_waitlists
  # GET /booking_waitlists.json
  def index
    if(User.find(current_user.id).user_type == 1)
      @booking_waitlists = BookingWaitlist.all
    elsif User.find(current_user.id).user_type == 2
      @booking_waitlists = BookingWaitlist.all.where(booking_id: Booking.all.where(user_id: current_user.id))
    elsif User.find(current_user.id).user_type == 3
      @booking_waitlists = BookingWaitlist.all.where(tour_id: Tour.all.where(user_id: current_user.id))
    end
  end

  # GET /booking_waitlists/1
  # GET /booking_waitlists/1.json
  def show
  end

  # GET /booking_waitlists/new
  def new
    @booking_waitlist = BookingWaitlist.new
  end

  # GET /booking_waitlists/1/edit
  def edit
  end

  # POST /booking_waitlists
  # POST /booking_waitlists.json
  def create
    @booking_waitlist = BookingWaitlist.new(booking_waitlist_params)

    respond_to do |format|
      if @booking_waitlist.save
        format.html { redirect_to @booking_waitlist, notice: 'Booking waitlist was successfully created.' }
        format.json { render :show, status: :created, location: @booking_waitlist }
      else
        format.html { render :new }
        format.json { render json: @booking_waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_waitlists/1
  # PATCH/PUT /booking_waitlists/1.json
  def update
    respond_to do |format|
      if @booking_waitlist.update(booking_waitlist_params)
        format.html { redirect_to @booking_waitlist, notice: 'Booking waitlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_waitlist }
      else
        format.html { render :edit }
        format.json { render json: @booking_waitlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_waitlists/1
  # DELETE /booking_waitlists/1.json
  def destroy
    @booking_waitlist.destroy
    respond_to do |format|
      format.html { redirect_to booking_waitlists_url, notice: 'Booking waitlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_waitlist
      @booking_waitlist = BookingWaitlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_waitlist_params
      params.require(:booking_waitlist).permit(:booking_id, :tour_id, :quantity)
    end
end
