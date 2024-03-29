# frozen_string_literal: true

class CampersController < ApplicationController
  before_action :set_camper, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /campers
  # GET /campers.json
  def index
    @campers = Camper.all.alphabetical.paginate(page: params[:campers]).per_page(10)
  end

  # GET /campers/1
  # GET /campers/1.json
  def show
    @camps = @camper.camps
    @current_camp = @camper.camps.current.first
    @current_badge = @camper.current_badge
    @current_tasks = @camper.current_tasks
    @camper_camp_badges_complete = @camper.camper_camp_badges.completed
    @camper_camp_badges_incomplete = @camper.camper_camp_badges.incomplete
  end

  # GET /campers/new
  def new
    @camper = Camper.new if logged_in? && current_user.role?(:admin)
  end

  # GET /campers/1/edit
  def edit
    if logged_in? && current_user.role?(:parent)
      @parent = Parent.where(user_id: current_user.id).first.id
    end
  end

  # POST /campers
  # POST /campers.json
  def create
    first_name = params[:camper][:first_name]
    last_name = params[:camper][:last_name]
    parent_id = params[:camper][:parent]
    active = params[:camper][:active]
    @camper = Camper.new(first_name: first_name, last_name: last_name, parent_id: parent_id, active: active)

    if @camper.save
      flash[:notice] = 'Successfully created camper.'
      redirect_to camper_path(@camper)
    else
      flash[:error] = 'Failed to create camper.'
      redirect_to new_camper_path
    end
  end

  # PATCH/PUT /campers/1
  # PATCH/PUT /campers/1.json
  def update
    if @camper.update(camper_params)
      flash[:notice] = 'Successfully updated camper.'
      redirect_to camper_path(@camper)
    else
      flash[:error] = 'Failed to update camper.'
      redirect_to edit_camper_path(@camper)
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
