# frozen_string_literal: true

class BranchesController < ApplicationController
  before_action :set_branch, only: %i[show edit update destroy]

  # GET /branches
  # GET /branches.json
  def index
    @branches = Branch.all.alphabetical.paginate(page: params[:branches]).per_page(10)
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @locations = @branch.locations.paginate(page: params[:locations]).per_page(10)
    @camps = @branch.camps
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit; end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    if @branch.save
      flash[:notice] = 'Successfully created branch.'
      redirect_to branch_path(@branch)
    else
      flash[:error] = 'Failed to create branch.'
      redirect_to new_branch_path
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    if @branch.update(branch_params)
      flash[:notice] = 'Successfully updated branch.'
      redirect_to branch_path(@branch)
    else
      flash[:error] = 'Failed to update branch.'
      redirect_to edit_branch_path(@branch)
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    @branch = Branch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def branch_params
    params.require(:branch).permit(:name)
  end
end
