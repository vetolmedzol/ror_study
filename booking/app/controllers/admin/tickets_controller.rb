# frozen_string_literal: true

class Admin::TicketsController < Admin::BasisController
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def edit; end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :first_railway_station_id,
                                   :last_railway_station_id, :user_name,
                                   :passport_data)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
