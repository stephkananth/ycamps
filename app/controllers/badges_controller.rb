# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :set_badge, only: %i[show edit update destroy]

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all.paginate(:page => params[:badges]).per_page(10)
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
    @camp_badges = @badge.camp_badges.alphabetical
    @skill = @badge.skill.name
    @tasks = @badge.tasks
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit;
  end

  # POST /badges
  # POST /badges.json
  def create
    badge_name = params[:badge][:name]
    skill_id = params[:badge][:skill]
    description = params[:badge][:description]
    level = params[:badge][:level]
    @badge = Badge.new(name: badge_name, skill_id: skill_id, level: level, description: description)

    respond_to do |format|
      if @badge.save
        format.html {redirect_to @badge, notice: 'Badge was successfully created.'}
        format.json {render :show, status: :created, location: @badge}
      else
        format.html {render :new}
        format.json {render json: @badge.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html {redirect_to @badge, notice: 'Badge was successfully updated.'}
        format.json {render :show, status: :ok, location: @badge}
      else
        format.html {render :edit}
        format.json {render json: @badge.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    skill_id = @badge.skill_id
    @badge.destroy
    redirect_to skill_path(skill_id), notice: "Badge — #{@badge.name} was removed from the system."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def badge_params
    params.require(:badge).permit(:name, :level, :description, :skill_id)
  end
end
