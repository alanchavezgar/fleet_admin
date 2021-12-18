class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy send_to_route finish_route ]

  # POST /vehicles/1/send_to_route or /vehicles/1/send_to_route.json
  def send_to_route
    respond_to do |format|
      if @vehicle.send_to_route(params[:route_id])
        format.json { render json: @vehicle }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /vehicles/1/finish_route or /vehicles/1/finish_route.json
  def finish_route
    respond_to do |format|
      if @vehicle.finish_route
        format.json { render json: @vehicle }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.fetch(:vehicle, {}).permit(:identifier, :fuel_consumption, :is_available, :city_id)
    end
end
