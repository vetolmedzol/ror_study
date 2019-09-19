# frozen_string_literal: true

class Admin::RoutesController < Admin::BasisController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @route.update(route_params)
      redirect_to [:admin, @route]
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :current_train_id,
                                  railway_station_ids: [],
                                  train_ids: [])
  end
end
