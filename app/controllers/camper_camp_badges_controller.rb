class CamperCampBadgesController < ApplicationController
  before_action :set_camper_camp_badge, only: %i[show edit update destroy]
  include CamperCampBadgesHelper


  # GET /camper_camp_badges
  # GET /camper_camp_badges.json
  def index
    @camper_camp_badges = CamperCampBadge.all
  end

  # GET /camper_camp_badges/1
  # GET /camper_camp_badges/1.json
  def show;
  end

  # GET /camper_camp_badges/new
  def new
    camp_badge_id = params[:camp_badge_id]
    @camp_badge = CampBadge.where(id: params[:camp_badge_id]).first
    @camp = Camp.where(id: @camp_badge.camp.id).first
    @campers = @camp.camper_registrations.map{|registration| registration.camper}
    @camper_camp_badge = CamperCampBadge.new
  end

  # GET /camper_camp_badges/1/edit
  def edit;
  end

  # POST /camper_camp_badges
  # POST /camper_camp_badges.json
  def create
    @camp_badge = CampBadge.where(id: params[:camper_camp_badge][:camp_badge_id]).first
  
    @camper_camp_badge = CamperCampBadge.new(camper_camp_badge_params)

    if @camper_camp_badge.save
      create_camper_tasks(@camp_badge.badge, @camper_camp_badge)
      redirect_to camp_badge_path(CampBadge.where(id: params[:camper_camp_badge][:camp_badge_id]).first), notice: "#{@camper_camp_badge.camper.name} was added to the system."
    else
      redirect_to new_camper_camp_badge_path(:camp_badge_id => params[:camper_camp_badge][:camp_badge_id])
    end
  end

  # PATCH/PUT /camper_camp_badges/1
  # PATCH/PUT /camper_camp_badges/1.json
  def update
    respond_to do |format|
      if @camper_camp_badge.update(camper_camp_badge_params)
        format.html {redirect_to @camper_camp_badge, notice: 'Camper camp badge was successfully updated.'}
        format.json {render :show, status: :ok, location: @camper_camp_badge}
      else
        format.html {render :edit}
        format.json {render json: @camper_camp_badge.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /camper_camp_badges/1
  # DELETE /camper_camp_badges/1.json
  def destroy
    @camper_camp_badge.destroy
    respond_to do |format|
      format.html {redirect_to camper_camp_badges_url, notice: 'Camper camp badge was successfully destroyed.'}
      format.json {head :no_content}
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
