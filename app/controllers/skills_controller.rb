# frozen_string_literal: true

class SkillsController < ApplicationController
  before_action :set_skill, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all.paginate(page: params[:skills]).per_page(10)
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @badges = @skill.badges.paginate(page: params[:badges]).per_page(10)
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit; end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      flash[:notice] = 'Successfully created skill.'
      redirect_to skill_path(@skill)
    else
      flash[:error] = 'Failed to create skill.'
      redirect_to new_skill_path
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    if @skill.update(skill_params)
      flash[:notice] = 'Successfully updated skill.'
      redirect_to skill_path(@skill)
    else
      flash[:error] = 'Failed to update skill.'
      redirect_to edit_skill_path(@skill)
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_skill
    @skill = Skill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def skill_params
    params.require(:skill).permit(:name, :category)
  end
end
