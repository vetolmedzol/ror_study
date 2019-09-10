# frozen_string_literal: true

class RemoveRailwayStationIdFromTrains < ActiveRecord::Migration[5.2]
  def change
    remove_column :trains, :railway_station_id, :integer
  end
end
