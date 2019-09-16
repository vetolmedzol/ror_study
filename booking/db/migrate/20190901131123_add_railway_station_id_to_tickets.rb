# frozen_string_literal: true

class AddRailwayStationIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :tickets, :first_railway_station_id
    add_belongs_to :tickets, :last_railway_station_id
  end
end
