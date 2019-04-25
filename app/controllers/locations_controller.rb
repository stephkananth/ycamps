# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: %i[show edit update destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @camps = @location.camps
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit;
  end

  # POST /locations
  # POST /locations.json
  def create
    branch_id = params[:location][:branch]
    location_name = params[:location][:name]

    @location = Location.new(name: location_name, branch_id: branch_id)

    if @location.save
      redirect_to location_path(@location), notice: "#{@location.name} location was added to the system."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html {redirect_to @location, notice: 'Location was successfully updated.'}
        format.json {render :show, status: :ok, location: @location}
      else
        format.html {render :edit}
        format.json {render json: @location.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html {redirect_to locations_url, notice: 'Location was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:name, :branch_id)
  end
end
