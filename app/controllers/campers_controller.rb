class CampersController < ApplicationController
  before_action :set_camper, only: %i[show edit update destroy]

  # GET /campers
  # GET /campers.json
  def index
    @campers = Camper.all
  end

  # GET /campers/1
  # GET /campers/1.json
  def show
    # @badges = Camper.camp_badges.badges
    # @current_camp = Camper.camps.current
  end

  # GET /campers/new
  def new
    @camper = Camper.new
  end

  # GET /campers/1/edit
  def edit; end

  # POST /campers
  # POST /campers.json
  def create
    @camper = Camper.new(camper_params)

    respond_to do |format|
      if @camper.save
        format.html { redirect_to @camper, notice: 'Camper was successfully created.' }
        format.json { render :show, status: :created, location: @camper }
      else
        format.html { render :new }
        format.json { render json: @camper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campers/1
  # PATCH/PUT /campers/1.json
  def update
    respond_to do |format|
      if @camper.update(camper_params)
        format.html { redirect_to @camper, notice: 'Camper was successfully updated.' }
        format.json { render :show, status: :ok, location: @camper }
      else
        format.html { render :edit }
        format.json { render json: @camper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campers/1
  # DELETE /campers/1.json
  def destroy
    @camper.destroy
    respond_to do |format|
      format.html { redirect_to campers_url, notice: 'Camper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camper
    @camper = Camper.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camper_params
    params.require(:camper).permit(:parent_id, :first_name, :last_name, :active)
  end
end
