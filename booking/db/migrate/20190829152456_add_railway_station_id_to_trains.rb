# frozen_string_literal: true

class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :trains, :current_railway_station
  end
end
