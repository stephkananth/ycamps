# frozen_string_literal: true

class CamperRegistrationsController < ApplicationController
  include CamperRegistrationsHelper
  before_action :set_camper_registration, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource

  # GET /camper_registrations
  # GET /camper_registrations.json
  def index
    @camper_registrations = CamperRegistration.where(camp_id: params[:camp_id]).paginate(page: params[:camper_registrations]).per_page(10)
    @camp = Camp.find(params[:camp_id])
  end

  # GET /camper_registrations/1
  # GET /camper_registrations/1.json
  def show; end

  # GET /camper_registrations/new
  def new
    @camper_registration = CamperRegistration.new
    @camp = Camp.find(params[:camp_id])
    @campers = Camper.all
  end

  # GET /camper_registrations/1/edit
  def edit; end

  # POST /camper_registrations
  # POST /camper_registrations.json
  def create
    @campers = params[:camper_registration][:camper_id].map(&:to_i).drop(1) - [0]
    @camp = Camp.find(params[:camper_registration][:camp_id])
    create_camper_registrations(@camp.id, @campers)
  end

  # PATCH/PUT /camper_registrations/1
  # PATCH/PUT /camper_registrations/1.json
  def update
    if @camper_registration.update(camper_registration_params)
      flash[:notice] = 'Successfully updated camper registration.'
      redirect_to camper_registration_path(@camper_registration)
    else
      flash[:error] = 'Failed to update camper registration.'
      redirect_to edit_camper_registration_path(@camper_registration)
    end
  end

  # DELETE /camper_registrations/1
  # DELETE /camper_registrations/1.json
  def destroy
    @camper_registration.destroy
    respond_to do |format|
      format.html { redirect_to camper_registrations_url, notice: 'Camper registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camper_registration
    @camper_registration = CamperRegistration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def camper_registration_params
  #   params.require(:camper_registration).permit(:camp_id, :camper_id)
  # end
end
