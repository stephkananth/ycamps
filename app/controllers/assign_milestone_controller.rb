class AssignMilestoneController < ApplicationController

  include AssignMilestoneHelper

  def index
    @camp_badge = CampBadge.where(:id => params[:camp_badge_id]).first
    @campers = @camp_badge.camper_camp_badges.map(&:camper)
    @tasks = @camp_badge.badge.tasks
  end

  def new
  end

  def create
    @camp_badge = params[:camp_badge_id].to_i
    @campers = params[:user][:other][:campers].map(&:to_i).drop(1)
    @task = params[:user][:other][:task].to_i
    assign_milestones_to_campers(@task, @camp_badge, @campers)
    redirect_to "/camp_badges/#{@camp_badge}"
  end

  private

  def milestone_params
    params.require(:camp_badge).permit(other: [:task, :campers])
  end
end
