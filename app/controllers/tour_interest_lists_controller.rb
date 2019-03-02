class TourInterestListsController < ApplicationController
  before_action :set_tour_interest_list, only: [:show, :edit, :update, :destroy]

  # GET /tour_interest_lists
  # GET /tour_interest_lists.json
  def index
    @tour_interest_lists = TourInterestList.all
  end

  # GET /tour_interest_lists/1
  # GET /tour_interest_lists/1.json
  def show
  end

  # GET /tour_interest_lists/new
  def new
    @tour_interest_list = TourInterestList.new
  end

  # GET /tour_interest_lists/1/edit
  def edit
  end

  # POST /tour_interest_lists
  # POST /tour_interest_lists.json
  def create
    @tour_interest_list = TourInterestList.new(tour_interest_list_params)

    respond_to do |format|
      if @tour_interest_list.save
        format.html { redirect_to @tour_interest_list, notice: 'Tour interest list was successfully created.' }
        format.json { render :show, status: :created, location: @tour_interest_list }
      else
        format.html { render :new }
        format.json { render json: @tour_interest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_interest_lists/1
  # PATCH/PUT /tour_interest_lists/1.json
  def update
    respond_to do |format|
      if @tour_interest_list.update(tour_interest_list_params)
        format.html { redirect_to @tour_interest_list, notice: 'Tour interest list was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_interest_list }
      else
        format.html { render :edit }
        format.json { render json: @tour_interest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_interest_lists/1
  # DELETE /tour_interest_lists/1.json
  def destroy
    @tour_interest_list.destroy
    respond_to do |format|
      format.html { redirect_to tour_interest_lists_url, notice: 'Tour interest list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_interest_list
      @tour_interest_list = TourInterestList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_interest_list_params
      params.require(:tour_interest_list).permit(:user_id, :tour_id)
    end
end
