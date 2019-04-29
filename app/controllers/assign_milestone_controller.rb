# frozen_string_literal: true

class AssignMilestoneController < ApplicationController
  include AssignMilestoneHelper
  before_action :check_login
  # load_and_authorize_resource :class => false

  def index
    authorize! :assign_controllers, CamperCampBadge
    @camp_badge = CampBadge.where(id: params[:camp_badge_id]).first
    @campers = @camp_badge.camper_camp_badges.map(&:camper)
    @tasks = @camp_badge.badge.tasks
  end

  def new
    authorize! :assign_controllers_new, CamperCampBadge
  end

  def create
    authorize! :assign_controllers_create, CamperCampBadge
    @camp_badge = params[:camp_badge_id].to_i
    @campers = params[:user][:other][:campers].map(&:to_i).drop(1) - [0]
    @task = params[:user][:other][:task].to_i
    flash[:notice] = 'Successfully added milestone.'
    assign_milestones_to_campers(@task, @camp_badge, @campers)
    redirect_to "/camp_badges/#{@camp_badge}"
  end

  private

  def milestone_params
    params.require(:camp_badge).permit(other: %i[task campers])
  end
end
