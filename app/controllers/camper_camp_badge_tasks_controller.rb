# frozen_string_literal: true

class CamperCampBadgeTasksController < ApplicationController
  before_action :set_camper_camp_badge_task, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /camper_camp_badge_tasks
  # GET /camper_camp_badge_tasks.json
  def index
    @camper_camp_badge_tasks = CamperCampBadgeTask.all
  end

  # GET /camper_camp_badge_tasks/1
  # GET /camper_camp_badge_tasks/1.json
  def show; end

  # GET /camper_camp_badge_tasks/new
  def new
    @camper_camp_badge_task = CamperCampBadgeTask.new
  end

  # GET /camper_camp_badge_tasks/1/edit
  def edit; end

  # POST /camper_camp_badge_tasks
  # POST /camper_camp_badge_tasks.json
  def create
    @camper_camp_badge_task = CamperCampBadgeTask.new(camper_camp_badge_task_params)

    respond_to do |format|
      if @camper_camp_badge_task.save
        format.html { redirect_to @camper_camp_badge_task, notice: 'Camper camp badge task was successfully created.' }
        format.json { render :show, status: :created, location: @camper_camp_badge_task }
      else
        format.html { render :new }
        format.json { render json: @camper_camp_badge_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camper_camp_badge_tasks/1
  # PATCH/PUT /camper_camp_badge_tasks/1.json
  def update
    respond_to do |format|
      if @camper_camp_badge_task.update(camper_camp_badge_task_params)
        format.html { redirect_to @camper_camp_badge_task, notice: 'Camper camp badge task was successfully updated.' }
        format.json { render :show, status: :ok, location: @camper_camp_badge_task }
      else
        format.html { render :edit }
        format.json { render json: @camper_camp_badge_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camper_camp_badge_tasks/1
  # DELETE /camper_camp_badge_tasks/1.json
  def destroy
    @camper_camp_badge_task.destroy
    respond_to do |format|
      format.html { redirect_to camper_camp_badge_tasks_url, notice: 'Camper camp badge task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camper_camp_badge_task
    @camper_camp_badge_task = CamperCampBadgeTask.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camper_camp_badge_task_params
    params.require(:camper_camp_badge_task).permit(:camper_camp_badge_id, :task_id, :completed)
  end
end
