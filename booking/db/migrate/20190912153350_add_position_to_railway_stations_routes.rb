# frozen_string_literal: true

class AddPositionToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :position, :integer
  end
end
