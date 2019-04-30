# frozen_string_literal: true

class CampBadgesController < ApplicationController
  before_action :set_camp_badge, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /camp_badges
  # GET /camp_badges.json
  def index
    @camp_badges = CampBadge.all.alphabetical.paginate(page: params[:camp_badges]).per_page(10)
  end

  # GET /camp_badges/1
  # GET /camp_badges/1.json
  def show
    @camp = @camp_badge.camp
    @badge = @camp_badge.badge
    @tasks = @badge.tasks
    @ccbs = @camp_badge.camper_camp_badges.paginate(page: params[:ccbs]).per_page(10)
    @counselors = @camp_badge.counselors
    if logged_in? && current_user.role?(:counselor)
      @counselor = Counselor.where(user_id: current_user).first
      @counselor_cb = @counselor.camp_badges
    end
  end

  # GET /camp_badges/new
  def new
    @camp_badge = CampBadge.new
  end

  # GET /camp_badges/1/edit
  def edit; end

  # POST /camp_badges
  # POST /camp_badges.json
  def create
    @camp_badge = CampBadge.new(camp_badge_params)

    if @camp_badge.save
      if current_user.role?(:counselor)
        @counselor_camp_badge = CounselorCampBadge.new(
          counselor_id: Counselor.where(user_id: current_user.id).first.id,
          camp_badge_id: @camp_badge.id
        )
        if @counselor_camp_badge.save
          flash[:notice] = 'Successfully create counselor camp badge.'
          redirect_to new_camper_camp_badge_path(camp_badge_id: @camp_badge.id)
        else
          flash[:error] = 'Failed to create counselor camp badge.'
          redirect_to new_camp_badge_path(camp_id: params[:camp_badge][:camp_id])
        end
      elsif current_user.role?(:admin)
        redirect_to camp_badge_path(@camp_badge)
      end
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /camp_badges/1
  # PATCH/PUT /camp_badges/1.json
  def update
    if @camp_badge.update(camp_badge_params)
      flash[:notice] = 'Successfully updated camp badge.'
      redirect_to camp_path(@camp_badge.camp)
    else
      flash[:error] = 'Failed to update camp badge.'
      redirect_to edit_camp_badge_path(@camp_badge)
    end
  end

  # DELETE /camp_badges/1
  # DELETE /camp_badges/1.json
  def destroy
    @camp_badge = CampBadge.find(params[:id])
    @camp_badge.destroy
    respond_to do |format|
      format.html { redirect_to camp_badges_url, notice: 'Camp badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camp_badge
    @camp_badge = CampBadge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camp_badge_params
    params.require(:camp_badge).permit(:badge_id, :camp_id)
  end
end
