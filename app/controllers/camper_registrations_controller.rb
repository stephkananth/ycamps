# frozen_string_literal: true

class CamperRegistrationsController < ApplicationController
  before_action :set_camper_registration, only: %i[show edit update destroy]

  # GET /camper_registrations
  # GET /camper_registrations.json
  def index
    @camper_registrations = CamperRegistration.where(camp_id: params[:camp_id])
  end

  # GET /camper_registrations/1
  # GET /camper_registrations/1.json
  def show;
  end

  # GET /camper_registrations/new
  def new
    @camper_registration = CamperRegistration.new
  end

  # GET /camper_registrations/1/edit
  def edit;
  end

  # POST /camper_registrations
  # POST /camper_registrations.json
  def create
    @camper_registration = CamperRegistration.new(camper_registration_params)

    if @camper_registration.save
      @camp = @camper_registration.camp
      redirect_to @camp, notice: 'Camper registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /camper_registrations/1
  # PATCH/PUT /camper_registrations/1.json
  def update
    respond_to do |format|
      if @camper_registration.update(camper_registration_params)
        format.html {redirect_to @camper_registration, notice: 'Camper registration was successfully updated.'}
        format.json {render :show, status: :ok, location: @camper_registration}
      else
        format.html {render :edit}
        format.json {render json: @camper_registration.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /camper_registrations/1
  # DELETE /camper_registrations/1.json
  def destroy
    @camper_registration.destroy
    respond_to do |format|
      format.html {redirect_to camper_registrations_url, notice: 'Camper registration was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camper_registration
    @camper_registration = CamperRegistration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camper_registration_params
    params.require(:camper_registration).permit(:camp_id, :camper_id)
  end
end
