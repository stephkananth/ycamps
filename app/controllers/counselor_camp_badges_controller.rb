class CounselorCampBadgesController < ApplicationController
  before_action :set_counselor_camp_badge, only: %i[show edit update destroy]

  # GET /counselor_camp_badges
  # GET /counselor_camp_badges.json
  def index
    @counselor_camp_badges = CounselorCampBadge.all
  end

  # GET /counselor_camp_badges/1
  # GET /counselor_camp_badges/1.json
  def show;
  end

  # GET /counselor_camp_badges/new
  def new
    camp_badge_id = params[:camp_badge_id]
    @camp_badge = CampBadge.where(id: params[:camp_badge_id]).first
    @counselor_camp_badge = CounselorCampBadge.new
  end

  # GET /counselor_camp_badges/1/edit
  def edit;
  end

  # POST /counselor_camp_badges
  # POST /counselor_camp_badges.json
  def create
    @camp_badge = CampBadge.where(id: params[:camp_badge_id]).first
    @counselor_camp_badge = CounselorCampBadge.new(counselor_camp_badge_params)
    if @counselor_camp_badge.save
      redirect_to camp_badge_path(CampBadge.where(id: params[:counselor_camp_badge][:camp_badge_id]).first), notice: "#{@counselor_camp_badge.counselor.name} was added to the system."
    else
      redirect_to new_camper_camp_badge_path(:camp_badge_id => params[:counselor_camp_badge][:camp_badge_id])
    end
  end

  # PATCH/PUT /counselor_camp_badges/1
  # PATCH/PUT /counselor_camp_badges/1.json
  def update
    respond_to do |format|
      if @counselor_camp_badge.update(counselor_camp_badge_params)
        format.html {redirect_to @counselor_camp_badge, notice: 'Counselor camp badge was successfully updated.'}
        format.json {render :show, status: :ok, location: @counselor_camp_badge}
      else
        format.html {render :edit}
        format.json {render json: @counselor_camp_badge.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /counselor_camp_badges/1
  # DELETE /counselor_camp_badges/1.json
  def destroy
    @counselor_camp_badge.destroy
    respond_to do |format|
      format.html {redirect_to counselor_camp_badges_url, notice: 'Counselor camp badge was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_counselor_camp_badge
    @counselor_camp_badge = CounselorCampBadge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def counselor_camp_badge_params
    params.require(:counselor_camp_badge).permit(:camp_badge_id, :counselor_id)
  end
end
