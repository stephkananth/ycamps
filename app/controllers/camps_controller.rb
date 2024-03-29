# frozen_string_literal: true

class CampsController < ApplicationController
  before_action :set_camp, only: %i[show edit update destroy]
  before_action :check_login
  authorize_resource


  # GET /camps
  # GET /camps.json
  def index
    @camps = Camp.all.paginate(page: params[:camps]).per_page(5)
    @upcoming_camps = Camp.upcoming.chronological.paginate(page: params[:upcoming_camps]).per_page(5)
    @past_camps = Camp.past.chronological.paginate(page: params[:past_camps]).per_page(5)
    @current_camps = Camp.current.chronological.paginate(page: params[:current_camps]).per_page(5)
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
    @camp_badges = @camp.badges
    @campers = @camp.camper_registrations
    @counselors = @camp.camp_counselors
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit; end

  # POST /camps
  # POST /camps.json
  def create
    camp_name = params[:camp][:name]
    camp_program = params[:camp][:program]
    begin
      start_date = Date.new(params[:camp]['start_date(1i)'].to_i, params[:camp]['start_date(2i)'].to_i, params[:camp]['start_date(3i)'].to_i)
    rescue ArgumentError
      flash[:error] = 'Invalid date.'
    end
    begin
      end_date = Date.new(params[:camp]['end_date(1i)'].to_i, params[:camp]['end_date(2i)'].to_i, params[:camp]['end_date(3i)'].to_i)
    rescue ArgumentError
      flash[:error] = 'Invalid date.'
    end
    
    active_status = params[:camp][:active]
    location_id = params[:camp][:location]

    @camp = Camp.new(name: camp_name, program: camp_program, start_date: start_date, end_date: end_date, location_id: location_id, active: active_status)

    if @camp.save
      flash[:notice] = 'Successfully created camp.'
      redirect_to @camp, notice: 'Camp was successfully created.'
    else
      flash[:error] = 'Failed to create camp.'
      render :new
    end
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    camp_name = params[:camp][:name]
    camp_program = params[:camp][:program]
    begin
      start_date = Date.new(params[:camp]['start_date(1i)'].to_i, params[:camp]['start_date(2i)'].to_i, params[:camp]['start_date(3i)'].to_i)
    rescue ArgumentError
      flash[:error] = 'Invalid date.'
    end
    begin
      end_date = Date.new(params[:camp]['end_date(1i)'].to_i, params[:camp]['end_date(2i)'].to_i, params[:camp]['end_date(3i)'].to_i)
    rescue ArgumentError
      flash[:error] = 'Invalid date.'
    end
    active_status = params[:camp][:active]
    location_id = params[:camp][:location]

    if @camp.update(name: camp_name, program: camp_program, start_date: start_date, end_date: end_date, location_id: location_id, active: active_status)
      flash[:notice] = 'Successfully updated camp.'
      redirect_to @camp, notice: 'Camp was successfully updated.'
    else
      flash[:error] = 'Failed to update camp.'
      render :edit
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to camps_url, notice: 'Camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_camp
    @camp = Camp.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def camp_params
    params.require(:camp).permit(:name, :program, :start_date, :end_date, :active, :location_id)
  end
end
