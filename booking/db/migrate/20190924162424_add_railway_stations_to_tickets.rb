class AddRailwayStationsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :tickets, :first_railway_station
    add_belongs_to :tickets, :last_railway_station
  end
end
