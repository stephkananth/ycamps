# frozen_string_literal: true

class CounselorsController < ApplicationController
  before_action :set_counselor, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /counselors
  # GET /counselors.json
  def index
    @counselors = Counselor.all.alphabetical.paginate(page: params[:counselors]).per_page(10)
  end

  # GET /counselors/1
  # GET /counselors/1.json
  def show
    @camps = @counselor.camps.paginate(page: params[:camps]).per_page(10)
    @past_camps = @counselor.camps.past.chronological.paginate(page: params[:past_camps]).per_page(10)
    @upcoming_camps = @counselor.camps.upcoming.chronological.paginate(page: params[:upcoming_camps]).per_page(10)
    @current_camps = @counselor.camps.current.chronological.paginate(page: params[:current_camps]).per_page(10)
    # @campers = @
  end

  # GET /counselors/new
  def new
    @counselor = Counselor.new
  end

  # GET /counselors/1/edit
  def edit; end

  # POST /counselors
  # POST /counselors.json
  def create
    @counselor = Counselor.new(counselor_params)
    @user = User.new(user_params)
    @user.role = 'counselor'
    if !@user.save
      @counselor.valid?
      flash[:notice] = 'Successfully created counselor.'
      render action: 'new'
    else
      @counselor.user_id = @user.id
      if @counselor.save
        flash[:notice] = "#{@counselor.first_name} #{@counselor.last_name} was added to the system."
        redirect_to counselor_path(@counselor)
      else
        flash[:error] = 'Failed to create counselor.'
        render action: 'new'
      end
    end
  end

  # PATCH/PUT /counselors/1
  # PATCH/PUT /counselors/1.json
  def update
    if @counselor.update(counselor_params)
      flash[:notice] = 'Successfully updated counselor.'
      redirect_to counselor_path(@counselor)
    else
      flash[:error] = 'Failed to update counselor.'
      redirect_to edit_counselor_path(@counselor)
    end
  end

  # DELETE /counselors/1
  # DELETE /counselors/1.json
  def destroy
    @counselor.destroy
    respond_to do |format|
      format.html { redirect_to counselors_url, notice: 'Counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_counselor
    @counselor = Counselor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def counselor_params
    params.require(:counselor).permit(:user_id, :active)
  end
end
