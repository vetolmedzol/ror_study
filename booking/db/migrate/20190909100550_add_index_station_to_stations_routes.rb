# frozen_string_literal: true

class AddIndexStationToStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :station_index, :integer
  end
end
