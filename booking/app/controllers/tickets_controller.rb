# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = current_user.tickets
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:number,
                                   :current_train_id,
                                   :first_railway_station_id, :user_id,
                                   :last_railway_station_id, :user_name,
                                   :passport_data)
  end
end
