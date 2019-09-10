# frozen_string_literal: true

class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[show edit update destroy]

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to @carriage.becomes(Carriage)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.becomes(Carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to train_path
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:train_id, :type, :top_seats,
                                     :lower_seats, :side_lower_seats,
                                     :side_top_seats)
  end
end
