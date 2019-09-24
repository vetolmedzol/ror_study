class AddRouteIndexToTrains < ActiveRecord::Migration[5.2]
  def change
    add_index :trains, :route_id
  end
end
