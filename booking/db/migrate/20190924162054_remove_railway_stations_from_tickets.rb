class RemoveRailwayStationsFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :first_railway_station_id_id
    remove_column :tickets, :last_railway_station_id_id
    remove_column :tickets, :railway_station_id
  end
end
