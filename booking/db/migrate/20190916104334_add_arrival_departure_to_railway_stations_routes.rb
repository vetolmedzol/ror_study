# frozen_string_literal: true

class AddArrivalDepartureToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :arrival, :time
    add_column :railway_stations_routes, :departure, :time
  end
end
