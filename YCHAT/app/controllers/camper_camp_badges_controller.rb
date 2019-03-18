class CamperCampBadgesController < ApplicationController
  before_action :set_camper_camp_badge, only: [:show, :edit, :update, :destroy]

  # GET /camper_camp_badges
  # GET /camper_camp_badges.json
  def index
    @camper_camp_badges = CamperCampBadge.all
  end

  # GET /camper_camp_badges/1
  # GET /camper_camp_badges/1.json
  def show
  end

  # GET /camper_camp_badges/new
  def new
    @camper_camp_badge = CamperCampBadge.new
  end

  # GET /camper_camp_badges/1/edit
  def edit
  end

  # POST /camper_camp_badges
  # POST /camper_camp_badges.json
  def create
    @camper_camp_badge = CamperCampBadge.new(camper_camp_badge_params)

    respond_to do |format|
      if @camper_camp_badge.save
        format.html { redirect_to @camper_camp_badge, notice: 'Camper camp badge was successfully created.' }
        format.json { render :show, status: :created, location: @camper_camp_badge }
      else
        format.html { render :new }
        format.json { render json: @camper_camp_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camper_camp_badges/1
  # PATCH/PUT /camper_camp_badges/1.json
  def update
    respond_to do |format|
      if @camper_camp_badge.update(camper_camp_badge_params)
        format.html { redirect_to @camper_camp_badge, notice: 'Camper camp badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @camper_camp_badge }
      else
        format.html { render :edit }
        format.json { render json: @camper_camp_badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camper_camp_badges/1
  # DELETE /camper_camp_badges/1.json
  def destroy
    @camper_camp_badge.destroy
    respond_to do |format|
      format.html { redirect_to camper_camp_badges_url, notice: 'Camper camp badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper_camp_badge
      @camper_camp_badge = CamperCampBadge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camper_camp_badge_params
      params.require(:camper_camp_badge).permit(:camp_badge_id, :camper_id, :completed)
    end
end
