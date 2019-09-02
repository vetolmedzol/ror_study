# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.belongs_to :first_railway_station
      t.belongs_to :last_railway_station

      t.timestamps
    end
  end
end
