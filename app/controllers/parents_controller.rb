# frozen_string_literal: true

class ParentsController < ApplicationController
  before_action :set_parent, only: %i[show edit update destroy]

  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all.paginate(page: params[:parents]).per_page(10)
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
    @campers = @parent.campers.paginate(page: params[:campers]).per_page(10)
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit; end

  # POST /parents
  # POST /parents.json
  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      flash[:notice] = 'Successfully created parent.'
      redirect_to parent_path(@parent)
    else
      flash[:error] = 'Failed to create parent.'
      redirect_to new_parent_path
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    if @parent.update(parent_params)
      flash[:notice] = 'Successfully updated parent.'
      redirect_to parent_path(@parent)
    else
      flash[:error] = 'Failed to update parent.'
      redirect_to edit_parent_path(@parent)
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent = Parent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def parent_params
    params.require(:parent).permit(:user_id, :active)
  end
end
