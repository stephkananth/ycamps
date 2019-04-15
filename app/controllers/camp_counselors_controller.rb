class CampCounselorsController < ApplicationController
  before_action :set_camp_counselor, only: [:show, :edit, :update, :destroy]

  # GET /camp_counselors
  # GET /camp_counselors.json
  def index
    @camp_counselors = CampCounselor.all
  end

  # GET /camp_counselors/1
  # GET /camp_counselors/1.json
  def show
  end

  # GET /camp_counselors/new
  def new
    @camp_counselor = CampCounselor.new
  end

  # GET /camp_counselors/1/edit
  def edit
  end

  # POST /camp_counselors
  # POST /camp_counselors.json
  def create
    @camp_counselor = CampCounselor.new(camp_counselor_params)

    respond_to do |format|
      if @camp_counselor.save
        format.html { redirect_to @camp_counselor, notice: 'Camp counselor was successfully created.' }
        format.json { render :show, status: :created, location: @camp_counselor }
      else
        format.html { render :new }
        format.json { render json: @camp_counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_counselors/1
  # PATCH/PUT /camp_counselors/1.json
  def update
    respond_to do |format|
      if @camp_counselor.update(camp_counselor_params)
        format.html { redirect_to @camp_counselor, notice: 'Camp counselor was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp_counselor }
      else
        format.html { render :edit }
        format.json { render json: @camp_counselor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_counselors/1
  # DELETE /camp_counselors/1.json
  def destroy
    @camp_counselor.destroy
    respond_to do |format|
      format.html { redirect_to camp_counselors_url, notice: 'Camp counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_counselor
      @camp_counselor = CampCounselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_counselor_params
      params.require(:camp_counselor).permit(:camp_id, :counselor_id)
    end
end
