# frozen_string_literal: true

class CampCounselorsController < ApplicationController
  # before_action :set_camp_counselor, only: [:show, :edit, :update, :destroy]

  # GET /camp_counselors
  # GET /camp_counselors.json
  def index
    @camp_counselors = CampCounselor.where(camp_id: params[:camp_id])
    @camp_id = params[:camp_id]
  end

  # GET /camp_counselors/1
  # GET /camp_counselors/1.json
  def show;
  end

  # GET /camp_counselors/new
  def new
    @camp_counselor = CampCounselor.new
    @camp = Camp.find(params[:camp_id])
    @other_counselors = @camp.counselors
  end

  # GET /camp_counselors/1/edit
  def edit;
  end

  # POST /camp_counselors
  # POST /camp_counselors.json
  def create
    @camp_counselor = CampCounselor.new(camp_counselor_params)
    if @camp_counselor.save
      flash[:notice] = 'Successfully added counselor.'
      redirect_to camp_path(@camp_counselor.camp)
    else
      @camp = Camp.find(params[:camp_counselor][:camp_id])
      @other_counselors = @camp.counselors
      render action: 'new', locals: {camp: @camp, other_counselors: @other_counselors}
    end
    # respond_to do |format|
    #   if @camp_counselor.save
    #     format.html {redirect_to @camp_counselor, notice: 'Camp counselor was successfully created.'}
    #     format.json {render :show, status: :created, location: @camp_counselor}
    #   else
    #     format.html {render :new}
    #     format.json {render json: @camp_counselor.errors, status: :unprocessable_entity}
    #   end
    # end
  end

  # PATCH/PUT /camp_counselors/1
  # PATCH/PUT /camp_counselors/1.json
  def update
    respond_to do |format|
      if @camp_counselor.update(camp_counselor_params)
        format.html {redirect_to @camp_counselor, notice: 'Camp counselor was successfully updated.'}
        format.json {render :show, status: :ok, location: @camp_counselor}
      else
        format.html {render :edit}
        format.json {render json: @camp_counselor.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /camp_counselors/1
  # DELETE /camp_counselors/1.json
  def destroy
    camp_id = params[:id]
    counselor_id = params[:counselor_id]
    @camp_counselor = CampCounselor.where(camp_id: camp_id, counselor_id: counselor_id).first
    unless @camp_counselor.nil?
      @camp_counselor.destroy
      flash[:notice] = 'Successfully removed this counselor.'
    end
    # @camp_counselor.destroy
    # respond_to do |format|
    #   format.html {redirect_to camp_counselors_url, notice: 'Camp counselor was successfully destroyed.'}
    #   format.json {head :no_content}
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camp_counselor
    @camp_counselor = CampCounselor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camp_counselor_params
    params.require(:camp_counselor).permit(:camp_id, :counselor_id)
  end
end
